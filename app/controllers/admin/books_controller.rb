class Admin::BooksController < ApplicationController
  before_action :logged_in_user, except: [:index, :edit, :update, :destroy]
  before_action :verify_admin, only: [:index, :create, :destroy]
  before_action :load_categories, :load_publishers, only: [:index, :new]

  def index
    @books = Book.load_by_order.paginate page: params[:page], per_page: Settings.books.page
  end

  def new
    @book = Book.new
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
    params.require(:book).permit :name, :image, :page, :category_id,
      :publisher_id, :description, :author_id
  end

  def load_categories
    @categories = Category.load_data
  end

  def load_publishers
    @publishers = Publisher.load_data
  end
end
