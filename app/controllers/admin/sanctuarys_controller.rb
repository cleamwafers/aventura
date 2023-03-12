class Admin::SanctuarysController < ApplicationController

  def index
    @sanctuarys = Sanctuary.all.page(params[:page])
    @sanctuary = Sanctuary.new
    @images = Sanctuary.all
  end

  def show
    @sanctuary = Sanctuary.new
    @post_comment = PostComment.new
    gon.sanctuary = @sanctuary
  end

  def destroy
    sanctuary = Sanctuary.find(params[:id])  # データ（レコード）を1件取得
    sanctuary.destroy  # データ（レコード）を削除
    redirect_to admin_sanctuarys_path # 聖地一覧画面へリダイレクト
  end

  private

  def sanctuary_params
    params.require(:sanctuary).permit(:image,:name,:user_id,:genre_id,:sanctuary_tags_id,:favorite_id,:place,:impression,:longitude,:latitude)
  end
end
