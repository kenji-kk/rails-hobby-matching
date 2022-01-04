class GroupChatsController < ApplicationController
  def create
    @group_chat = GroupChat.new(group_chat_params)
    if @group_chat.save
      redirect_to "/hobby_rooms/chat/#{@group_chat.hobby_room.id}"
    else
      render 'hobby_rooms/chat_group'
    end
  end

  private
    def group_chat_params
      params.require(:group_chat).permit(:content, :name, :hobby_room_id)
    end
end
