class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :ensure_admin!

  private

  def authenticate_user!
    redirect_to new_user_session_path unless current_user
  end

  def ensure_admin!
    redirect_to root_path unless current_user.admin?
  end
end
