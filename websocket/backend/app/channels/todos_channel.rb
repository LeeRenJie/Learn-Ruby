class TodosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "todos_channel"
  end

  def unsubscribed
    raise NotImplementedError
  end
end
