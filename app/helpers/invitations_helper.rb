module InvitationsHelper
  def is_invited?(user)
    current_user.invitees.include?(user)
  end
end
