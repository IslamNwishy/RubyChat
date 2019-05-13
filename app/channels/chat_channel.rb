class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def receive(data)
    @message = Message.new
    @message.chat_room_id=data["chat_room_id"]
    @message.user_id=data["user_id"]
    @message.body=data["body"]
    @message.save
    data["id"]=@message.id
    ActionCable.server.broadcast("chat", data)
  end
  # def receive(data)
  #   note = Note.find(data["id"])
  #   note.update!(text: data["text"])
  #   ActionCable.server.broadcast('notes', data)
  # end
end