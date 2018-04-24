class AddDefaultToInvitationState < ActiveRecord::Migration[5.1]
  def change
    change_column :invitations, :state, :string, :default => 'pending'
  end
end
