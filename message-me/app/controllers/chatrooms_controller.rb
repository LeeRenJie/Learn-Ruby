class ChatroomsController < ApplicationController
  before_action :validate_user_logged_in

  def index
    @message = Message.new
    @messages = Message.all
  end

end
