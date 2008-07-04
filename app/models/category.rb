class Category < ActiveRecord::Base
  has_many :categories
  belongs_to :category
end
