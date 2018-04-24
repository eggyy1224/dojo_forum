class Invitation < ApplicationRecord
  validates :inviter_id, uniqueness: { scope: :invitee_id }
  before_save :create_friendships
  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"

  def create_friendships
    if self.state == 'accept'
      Friendship.create!(user: self.inviter, friend: self.invitee)
      Friendship.create!(user: self.invitee, friend: self.inviter)
    end
  end
end
