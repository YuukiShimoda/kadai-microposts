class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = Micropost.find(params[:micropost_id])
    current_user.favorite(user)
    flash[:success] = 'MicropostをFavoriteしました。'
    redirect_to user
  end

  def destroy
    user = Micropost.find(params[:micropost_id])
    current_user.unfavorite(user)
    flash[:success] = 'MicropostのFavoriteを解除しました。'
    redirect_to user
  end
end
