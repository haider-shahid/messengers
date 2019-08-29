class ChatroomController < ApplicationController
  before_action :require_user,only: [:index]
  def index
    @msg = Message.new
    @messages = Message.all
  end
end
