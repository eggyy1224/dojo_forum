class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories, source: :category
end
