class PostCommentsController < ApplicationController

  def create
    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id
    @book = Book.find(params[:book_id])
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def update
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
