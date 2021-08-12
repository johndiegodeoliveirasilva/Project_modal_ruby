class UsersController < ApplicationController
  before_action :set_users, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(set_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(set_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Content successfully updated!'
  end

  def show; end

  def edit; end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(:name, :age, :bio, :email)
  end
end
