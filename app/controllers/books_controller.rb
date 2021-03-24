class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @new_book= Book.new
     @user_name= User.find_by(params[:name])
    @user_intro= User.find_by(params[:introduction])
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    @new_book.save
    redirect_to books_path
  end

  def show
      @new_book = Book.new
    @book = Book.find(params[:id])
   @user = @book.user
    @user_name= User.find_by(params[:name])
    @user_intro= User.find_by(params[:introduction])
  end
  
  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
