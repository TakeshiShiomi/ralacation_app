class LikesController < ApplicationController
  def index
    @photos = Photo.joins(:likes).where(likes: { user_id: params[:user_id] }).order(created_at: :desc)
  end

  def create
    Like.create(user_id: current_user.id, photo_id: params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find_by(user_id: current_user.id, photo_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
