class InvitationsController < ApplicationController
  def create
    @invitation = current_user.invitations.build(invitee_id: params[:user_id])
    if @invitation.save
      flash[:notice] = "成功發出邀請"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "無法發出邀請"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @invitation = current_user.invitations.find_by(invitee_id: params[:id])
    @invitation.delete
    flash[:notice] = "成功收回邀請"
    redirect_back(fallback_location: root_path)
  end

  def accept
    @invitation = current_user.reverse_invitations.find_by(inviter_id: params[:id])
    @invitation.state = 'accept'
   
    @invitation.save
    flash[:notice] = '你們是朋友了'
    redirect_back(fallback_location: root_path)
  end

  def decline
    @invitation = current_user.reverse_invitations.find_by(inviter_id: params[:id])
    @invitation.state = 'decline'
    @invitation.save
    flash[:notice] = '成功拒絕邀請'
    redirect_back(fallback_location: root_path)
  end
end
