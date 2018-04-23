class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private
  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:alert] = "權限不足"
      redirect_back(fallback_location: root_path) 
    end
  end
end
