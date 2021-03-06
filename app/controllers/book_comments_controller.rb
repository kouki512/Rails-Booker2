class BookCommentsController < ApplicationController
   def create
     book = Book.find(params[:book_id])
     @comment = current_user.book_comments.new(book_comment_params)
     @comment.book_id = book.id
    if @comment.save
      flash[:success] = "Successfully commented!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Failed to comment..."
      redirect_back(fallback_location: root_path)
    end
   end
   def destroy
    # @book = Book.find(params[:book_id])
    # @comment = @book.book_comments.find(params[:id])
     BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
     #@comment.destroy
     redirect_back(fallback_location: root_path)
   end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)

  end

end
