class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories, source: :category, dependent: :destroy
end
