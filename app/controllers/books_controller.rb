class BooksController < ApplicationController
  def new
    # @book = Book.new
  end
  
  def about
  end

  def create
    @book = Book.new(book_params)
    # booksのuser_idカラムは現在ログイン中のIDで保存する
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books=Book.all
    # index内に投稿を置く場合、newが必要
    @book = Book.new
    # ログイン中のユーザーを渡す
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    # ログイン中のユーザーを渡す※プロフィール画像用
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
    # params.permit(:title, :body)
  end
end
