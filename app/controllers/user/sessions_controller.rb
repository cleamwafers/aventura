# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  protected
   # 退会しているかを判断するメソッド
  def user_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @user.valid_password?(params[:user][:password]) && (@user.is_deleted ==false)
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_user_registration_path
    ## 【処理内容3】「1」と「2」の処理が真(true)だった場合、そのアカウントのis_deletedカラムに格納されている値を確認し
      # trueだった場合、退会しているのでサインアップ画面に遷移する
  else
      flash[:notice] = "項目を入力してください"
      # falseだった場合、
    # true && false == false
  end
  end
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
