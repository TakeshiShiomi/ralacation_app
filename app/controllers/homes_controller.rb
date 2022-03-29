class HomesController < ApplicationController
  def top
    @photo = current_user.photos.new
    if user_signed_in?
      @feeds = Photo.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
    else
    end
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to root_path
    else
      render new
    end
  end
  
  def about
  end
end
