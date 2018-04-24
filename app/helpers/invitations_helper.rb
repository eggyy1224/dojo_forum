module InvitationsHelper
  def is_invited?(user)
    current_user.invitees.include?(user) 
  end

  def is_invited_by?(user)
    user.invitees.include?(current_user) 
  end
end
