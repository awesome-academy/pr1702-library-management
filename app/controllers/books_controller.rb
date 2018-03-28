class BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: 1
  end

  def show
    @book = Book.find_by id: params[:id]
    redirect_to root_url if @book.nil?
  end
end
