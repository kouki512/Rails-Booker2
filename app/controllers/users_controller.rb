class UsersController < ApplicationController
   before_action :move_to_signed_in
   
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
    unless @user.user_id == current_user.id
      redirect_to users_path
    end
  end
  
  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:prifile_image)
  end
  
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end
end
