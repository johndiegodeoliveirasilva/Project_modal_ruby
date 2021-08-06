class UsersController < ApplicationController
  before_action :set_users, only: [:edit, :show, :update, :destroy]

  def index
    @user = User.new
  end

  def new
    @user = User.new
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
