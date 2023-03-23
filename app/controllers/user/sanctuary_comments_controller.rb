class User::SanctuaryCommentsController < ApplicationController
  def create
    @sanctuary_comment = SanctuaryComment.new(sanctuary_params)
    @sanctuary_comment.save
    redirect_to user_sanctuary_path(params[:sanctuary_id])
  end

  def destroy
    SanctuaryComment.find(params[:id]).destroy
    redirect_to user_sanctuary_path(params[:sanctuary_id])
  end

  private

  def sanctuary_params
    params.require(:sanctuary_comment).permit(:comment)
          .merge(user_id: current_user.id, sanctuary_id: params[:sanctuary_id])
  end
end
