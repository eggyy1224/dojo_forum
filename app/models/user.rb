class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commentted_articles, through: :comments, source: :article
  has_many :collections, dependent: :destroy
  has_many :collection_articles, through: :collections, source: :article
end
