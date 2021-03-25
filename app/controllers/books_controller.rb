class BooksController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @books = Book.all
    @new_book= Book.new
    @user= current_user
    
   #@user= User.find_by(params[:name])
   #@user= User.find_by(params[:introduction])
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    
    if @new_book.save
      flash[:success] =  "You have created book successfully"
      redirect_to book_path(@new_book)
    else
      @books = Book.all
      @user = current_user
      #@user_name= User.find_by(params[:name])
     # @user_intro= User.find_by(params[:introduction])
      render 'index'
    end
  end

  def show
      @new_book = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
      #@user= User.find(params[:id])
    # @user_name= User.find_by(params[:name])
    # @user_intro= User.find_by(params[:introduction])
  end
  
  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end
  
  def update
    
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render 'edit'
    end
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
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sigh_in'
    end
  end
end
