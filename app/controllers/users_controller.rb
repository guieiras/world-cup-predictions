class UsersController < Clearance::UsersController
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def url_after_create
    byebug
    params[:invite] ? league_invite_path(params[:invite]) : super
  end
end
