class Invitation < ApplicationRecord
  validates :inviter_id, uniqueness: { scope: :invitee_id }
  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"
end
