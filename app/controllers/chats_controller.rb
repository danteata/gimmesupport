class ChatsController < ApplicationController
  responds_to :html, :js
  def index
    @chats = Chat.all
  end
  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(params[:chat])
    if @chat.save
      flash[:success] ="chat submitted"
      redirect_to "index"
    end
  end

end
