class User::FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.new(sanctuary_id: params[:sanctuary_id])
    favorite.save
    redirect_to user_sanctuary_path(params[:sanctuary_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(sanctuary_id: params[:sanctuary_id])
    favorite.destroy
    redirect_to user_sanctuary_path(params[:sanctuary_id])
  end
end
