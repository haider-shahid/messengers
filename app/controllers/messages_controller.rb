class MessagesController < ApplicationController
  before_action :require_user
  def create
    msg = current_user.messages.build(params_msg)
    if msg.save
      redirect_to root_path
    else
      flash[:error]="Cant send Empty Message."
      redirect_to root_path
    end
  end

  private

  def params_msg
    params.require(:message).permit(:body)
  end
end
