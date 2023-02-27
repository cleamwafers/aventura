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
    redirect_to user_homes_top_path
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
    flash[:notice] = "ありがとうございました。またのご利用ください。"
    redirect_to root_path
  end
end
