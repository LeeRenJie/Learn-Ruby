class MessagesController < ApplicationController
  def index
  end

  def create
    Message.create(content: params[:message])
    ActionCable.server.broadcast('messages', { messages: Message.all })
  end
end
