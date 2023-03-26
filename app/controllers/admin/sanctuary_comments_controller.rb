class Admin::SanctuaryCommentsController < ApplicationController
  def destroy
    SanctuaryComment.find(params[:id]).destroy
    redirect_to admin_sanctuary_path(params[:sanctuary_id])
  end
end
