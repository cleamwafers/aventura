class User::FavoritesController < ApplicationController

  def create
    sanctuary = Sanctuary.find(params[:sanctuary_id])
    favorite = current_user.favorites.new(sanctuary_id: sanctuary.id)
    favorite.save
    redirect_to sanctuary_path(sanctuary)
  end

  def destroy
    sanctuary = Sanctuary.find(params[:sanctuary_id])
    favorite = current_user.favorites.find_by(sanctuary_id: sanctuary.id)
    favorite.destroy
    redirect_to sanctuary_path(sanctuary)
  end
end
