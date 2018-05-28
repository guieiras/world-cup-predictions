class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit

  before_action :require_login
end
