class BookCommentsController < ApplicationController
   def create
     book = Book.find(params[:book_id])
     @comment = current_user.book_comments.new(book_comment_params)
     @comment.book_id = book.id
    if @comment.save
      flash[:success] = "Successfully commented!"
      redirect_to book_path(book)
    else
    flash[:notice] = "Failed to comment..."
    redirect_to book_path(book)  
    end
   end
   def destroy
     book = Book.find(params[:id])
     book_comment = BookComment.find_by(book_id: params[:book_id])
     book_comment.destroy
     redirect_to book_path(book)
   end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
    
  end
  
end
