class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @books = Book.all.page(params[:page]).reverse_order
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created Book successfully.'
    else
      # このコントローラー内のアクション名を書くと、それに対応するViewが表示される
      render :index
    end
  end

  def index
    @books = Book.all.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path((@book.id)), notice: 'You have updated book successfully.'
    else
      render :edit
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

end
