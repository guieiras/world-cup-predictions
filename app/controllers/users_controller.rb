class UsersController < Clearance::UsersController
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
