class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:edit, :update]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "登録が完了しました"
  		redirect_to user_path(@user)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :career, :wants, :skill, :license, :hobby, :back_image)
  end
end
