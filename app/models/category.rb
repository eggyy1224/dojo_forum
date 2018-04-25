class Category < ApplicationRecord
  validates_presence_of :name, message: "分類名字不能為空"
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
end