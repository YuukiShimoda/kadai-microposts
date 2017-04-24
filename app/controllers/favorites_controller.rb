class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
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
  
   def micropost_params
    params.require(:favorite).permit(:content)
  end

end
