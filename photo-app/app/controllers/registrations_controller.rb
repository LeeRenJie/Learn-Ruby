class RegistrationsController < Devise::RegistrationsController
  def create
    # Build a devise resource passing in the session.
    # Useful to move temporary session data to the newly created user.
    build_resource(sign_up_params)

    # "Resource" is a substitute for the name of the users ie: swimmers, admins, etc. In our case is "users".
    # Transactions are protective blocks where SQL statements are only permanent if they can all succeed as one atomic action
    resource.class.transaction do
      #save user
      resource.save
      # Allow subclasses to reuse the create implementation provided by devise with super keyword, but being able to hook into the process.
      yield resource if block_given?
      # Returns true if the resource is persisted, i.e. it’s not a new user record and it was not destroyed, otherwise returns false.
      if resource.persisted?
        # Create new payment for the user
        @payment = Payment.new({ email: params["user"]["email"], token: params[:payment]["token"], user_id: resource.id })
        # if payment is invalid, then flash message is displayed.
        flash[:error] = "Please check registration errors" unless @payment.valid?

        # begin runs code that may cause an exception
        begin
          @payment.process_payment
          @payment.save
        # rescue is used to catch the exception
        rescue Exception => e
          # Display error message
          flash[:error] = e.message
          # Destroy user information
          resource.destroy
          puts 'Payment failed'
          # redirect to new sign up page
          render :new and return
        end

        # After authenticating a user and in each request, Devise checks if your model is active by calling model.active_for_authentication?
        if resource.active_for_authentication?
          # set up the flash messages using specific resource scope
          set_flash_message :notice, :signed_up
          # Signs in a user on sign up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end

      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:payment)
  end

end

