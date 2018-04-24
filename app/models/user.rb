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

  has_many :invitations, -> {where(state: 'pending')}, foreign_key: :inviter_id, dependent: :destroy
  has_many :invitees, through: :invitations

  has_many :reverse_invitations, -> {where(state: 'pending')}, foreign_key: :invitee_id, class_name: "Invitation", dependent: :destroy
  has_many :inviters, through: :reverse_invitations

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
