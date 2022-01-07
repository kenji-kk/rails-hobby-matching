class GroupChatsController < ApplicationController
  def create_chat
    @group_chat = GroupChat.new(group_chat_params)
    if @group_chat.save
      flash[:success] = "チャットを投稿しました。"
      redirect_to "/hobby_rooms/chat/#{@group_chat.hobby_room.id}"
    else
      @hobby_room = HobbyRoom.find(@group_chat.hobby_room.id)
      @chats = @hobby_room.group_chats
      render 'hobby_rooms/chat_group'
    end
  end

  def create_reply
    @reply = Reply.new(reply_params)
    if @reply.save
      flash[:success] = "リプライの投稿を投稿しました。"
      redirect_to "/hobby_rooms/chat/#{params[:id]}"
    else
      flash.now[:danger] = "リプライの入力値に誤りがありました。（空欄、201文字以上不可）"
      @group_chat = GroupChat.new
      @hobby_room = HobbyRoom.find(params[:id])
      @chats = @hobby_room.group_chats
      render 'hobby_rooms/chat_group'
    end
  end

  private
    def group_chat_params
      params.require(:group_chat).permit(:content, :name, :hobby_room_id)
    end

    def reply_params
      params.require(:reply).permit(:content, :name, :group_chat_id)
    end
end
