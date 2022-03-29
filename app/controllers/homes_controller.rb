class HomesController < ApplicationController

  def top
    if user_signed_in?
      @feeds = Photo.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
    else
    end
  end

  def about
  end
end
