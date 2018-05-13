class AdminController < ApplicationController
  before_action :verify_if_user_is_admin

  def verify_if_user_is_admin
    raise ActionController::RoutingError.new('Unauthorized User') unless current_user.admin?
  end
end
