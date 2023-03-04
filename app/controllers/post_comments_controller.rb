class PostCommentsController < ApplicationController

  def create
    sanctuary = Sanctuary.find(params[:sanctuary_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.sanctuary_id = sanctuary.id
    comment.save
    redirect_to sanctuary_path(sanctuary)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
