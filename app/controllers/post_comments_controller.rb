class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end


  def destroy
    book = Book.find(params[:id])
    post_comment = current_user.post_comments.find_by(book_id: book.id)
    post_comment.destroy
    redirect_to book_path(book)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
