class User::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to user_user_path
    else
      render :edit and return
    end
  end

  def quit
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)

    reset_session
    flash[:notice] = "ありがとうございました。またご利用ください。"
    redirect_to root_path
  end

  def user_params
  	params.require(:user).permit(:name, :email, :favorite_id,:sanctuary_id,:sns,:introduction,:is_deleted,:image)
  end
end
