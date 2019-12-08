class Admin::RegistrationsController < ApplicationController
  # before_action :fetch_user, only: %i[update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'admin/registrations/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'admin/registrations/edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      redirect_to admin_users_path
    else
      render 'admin/registrations/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :first_name,
      :last_name,
      :avatar,
      :bio,
      :byline,
      :website,
      :password
      )
  end

end
