class LikeRoomsController < ApplicationController
  def create
    like = current_user.like_room.new(hobby_room_id: params[:room_id])
    if like.save 
      flash[:success] = "投稿に「いいね！」しました。"
      redirect_back(fallback_location: hobby_rooms_path)
    else
      flash[:alert] = '「いいね！」に失敗しました。'
      redirect_back(fallback_location: hobby_rooms_path)
    end
  end
end
