class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @users = User.page(params[:page])
  end

  def edit
    @users = User.page(params[:page])
  end

  def update
    @users = User.page(params[:page])
    if @user.update(user_params)
			   flash[:success] = "ユーザー情報を更新しました"
			   redirect_to admin_user_path
		else
				render "edit"
		end
  end

  def destroy
  end

  private
  def user_params
	  params.require(:user).permit(:name,:introduction,:sns,:email,:is_deleted)
  end
end
