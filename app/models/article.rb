class Article < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :auth
  validates_presence_of :state
  mount_uploader :image, ImageUploader
  paginates_per 20
  belongs_to :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories, source: :category, dependent: :destroy
  has_many :comments
  has_many :collections
  has_many :collection_users, through: :collections, source: :user, dependent: :destroy
end
