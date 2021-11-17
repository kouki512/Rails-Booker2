class UsersController < ApplicationController
   before_action :move_to_signed_in

  def index
    @user= current_user
    @users = User.all
    @new_book= Book.new
    #@user_name= User.find_by(params[:id])
    #@user_intro= User.find_by(params[:introduction])
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @user_books = @user.books
    #@user_name= User.find_by(params[:id])
    #@user_intro= User.find_by(params[:introduction])
  end

  def edit
     @user = User.find(params[:id])
     unless @user.id == current_user.id
       redirect_to user_path(current_user.id)
     end
  end

  def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated User successfully."
      redirect_to user_path(@user)
    else
    render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end
end