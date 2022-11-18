class MessagesController < ApplicationController

  before_action :require_user

  def create
    message = current_user.messages.build(whitelist_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: render_partial(message)
    end
  end

  private

  def whitelist_params
    params.require(:message).permit(:body)
  end

  def render_partial(message)
    render(partial: "message", locals: {message: message})
  end

end