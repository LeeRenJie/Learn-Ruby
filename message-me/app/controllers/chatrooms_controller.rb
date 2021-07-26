class ChatroomsController < ApplicationController
  before_action :validate_user_logged_in

  def index
    @message = Message.new
    @messages = Message.custom_display
  end

  private

  def custom_display

  end
end
