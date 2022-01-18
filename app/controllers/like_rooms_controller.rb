class LikeRoomsController < ApplicationController
  def create
    unless current_user.like_rooms.include?(LikeRoom.find_by(hobby_room_id: params[:room_id], user_id: current_user.id))
      like = current_user.like_rooms.new(hobby_room_id: params[:room_id])
      if like.save 
        flash[:success] = "投稿に「いいね！」しました。"
        redirect_back(fallback_location: hobby_rooms_path)
      end
    else
      LikeRoom.find_by(hobby_room_id: params[:room_id], user_id: current_user.id).delete
      flash[:danger] = '投稿から「いいね！」を取り消しました。'
      redirect_back(fallback_location: hobby_rooms_path)
    end
  end
end
