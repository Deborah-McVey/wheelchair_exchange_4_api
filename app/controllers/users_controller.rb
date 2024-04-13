class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # POST users
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created, location: @users
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy!
      render json: nil, status: :ok
    end
      render json: @user.errors, status: :unprocessable_entity
  end

#def posts_index
#   user = User.find(params[:user_id])
#   user_posts = user.posts
#   render json: user_posts, status: :ok
#end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end 