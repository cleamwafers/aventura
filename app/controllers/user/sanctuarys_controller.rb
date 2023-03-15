class User::SanctuarysController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def new
    @sanctuary =Sanctuary.new
  end

  def create
    @sanctuary = Sanctuary.new(sanctuary_params)
    @sanctuary.user_id = current_user.id
    @sanctuary.save
    flash[:success] = "聖地を登録しました"
    redirect_to sanctuary_path
  end

  def index
    @sanctuarys = Sanctuary.all.page(params[:page])
    @sanctuary = Sanctuary.new
    @images = Sanctuary.all
  end

  def show
    @sanctuary = Sanctuary.find(params[:id])
    gon.sanctuary = @sanctuary
  end

  def edit
    @sanctuary = Sanctuary.find(params[:id])
  end

  def update
     @sanctuary = Sanctuary.find(params[:id])
    if @sanctuary.update(sanctuary_params)
      flash[:notice] ="聖地を更新しました"
      redirect_to user_sanctuary_path(@sanctuary)
    else
      render "show"
    end
  end

  def destroy
    sanctuary = Sanctuary.find(params[:id])  # データ（レコード）を1件取得
    sanctuary.destroy  # データ（レコード）を削除
    redirect_to 'show'  # 投稿一覧画面へリダイレクト
  end

  def search
    @results = @q.result
  end

private

  def set_q
    @q = Sanctuary.ransack(params[:q])
  end

  def sanctuary_params
    params.require(:sanctuary).permit(:image,:name,:favorite_id,:genre_id,:user_id,:sanctuary_tags_id,:longitude,:latitudeplace,:impression,:address)
  end
end
