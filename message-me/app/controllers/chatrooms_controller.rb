class ChatroomsController < ApplicationController
  before_action :validate_user_logged_in
  def index
    @messages = Message.all
  end

end
