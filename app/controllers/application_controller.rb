class ApplicationController < ActionController::Base
  def current_user
    params[:user_id] ? User.find(params[:user_id]) : User.first
  end
end
