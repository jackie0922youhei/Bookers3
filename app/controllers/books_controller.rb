class BooksController < ApplicationController


  def create
    @post_book = Book.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to root_path
  end

  def index
    @post_book = Book.new
    @post_books = Book.all
  end

  def show
  end

  private
  def post_book_params
    params.require(:book).permit(:title, :body)
  end

end
