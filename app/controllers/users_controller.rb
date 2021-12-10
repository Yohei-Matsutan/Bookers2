class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    # kaminari入れなきゃ
    @books = @user.books.page(params[:page]).reverse_order
    @newbook = Book.new
  end
end
