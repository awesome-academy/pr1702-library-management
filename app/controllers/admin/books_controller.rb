class Admin::BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: 5
  end

  def new
    @book = Book.new params[:book]
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".book_create"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :image, :page, :category_id,
      :publisher_id, :description, :author_id)
  end
end
