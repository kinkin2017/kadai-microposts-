class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'Micropostをお気に入りに入れました。'
    redirect_to likings_user_path(current_user)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'Micropostをお気に入りから削除しました。'
    #redirect_to micropost.user
    redirect_to likings_user_path(current_user)
  end
end
