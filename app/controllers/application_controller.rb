class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # helper_method :current_user

  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:alert] = "You aren't authorized to do that."
      redirect_to '/'
    end
  end

  # def authorize
  #   if !current_user
  #     flash[:alert] = "You need to drop your fishing line in different waters. You aren't charted to fish here."
  #     redirect_to '/'
  #   end
  # end
end
