class UsersController < ApplicationController
  
  def index
    @users = User.all
    @new_book= Book.new
    @user_name= User.find_by(params[:name])
    @user_intro= User.find_by(params[:introduction])
  end
  
  def show
    @user = User.find(params[:id])  
    @new_book = Book.new
    @user_books = @user.books
    @user_name= User.find_by(params[:name])
    @user_intro= User.find_by(params[:introduction])
  end
  
  def edit
    # @user = User.find(params[:id])
  end
  
  def update
  
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:prifile_image)
  end
  
  
end
