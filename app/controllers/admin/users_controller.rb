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
    if @customer.update(customer_params)
			   flash[:success] = "Customer was successfully updated"
			   redirect_to admin_customer_path
		else
				render "edit"
		end
  end

  def destroy
  end

  private
  def customer_params
	  params.require(:user).permit(:name,:introduction,:sns,:email,:is_deleted)
  end
end
