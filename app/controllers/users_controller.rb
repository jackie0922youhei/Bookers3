class UsersController < ApplicationController

before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post_book = Book.new
    @books = @user.books
    @post_books = Book.all
  end

  def index
    @user = current_user
    @userss = User.all
    @post_book = Book.new
    # if params[:name].present?
    #   @users = User.where('name LIKE ?', "%#{params[:name]}%")
    # else
    #   @users = User.none
    # end
  end

  def edit
    @user = User.find(params[:id])
    if @user== current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
