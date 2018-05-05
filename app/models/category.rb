class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :load_data, ->{select(:id, :name)}
end
