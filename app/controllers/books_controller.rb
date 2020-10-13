class BooksController < ApplicationController

before_action :authenticate_user!

  def create
    @post_book = Book.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@post_book.id)
    else
      @post_books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @post_book = Book.new
    @post_books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(post_book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def post_book_params
    params.require(:book).permit(:title, :body)
  end

end
