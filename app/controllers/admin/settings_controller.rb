class Admin::SettingsController < AdminController
  def index
    @settings = Setting.to_h
  end

  def create
    params[:settings].permit!
    params[:settings].each do |setting, value|
      Setting[setting] = value
    end

    redirect_to admin_settings_path
  end
end
