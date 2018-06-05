class UsersController < Clearance::UsersController
  skip_before_action :require_login, only: [:welcome, :confirm], raise: false
  skip_before_action :authorize, only: [:welcome, :confirm], raise: false

  def create
    @user = user_from_params

    if @user.save
      @user.update(email_token: SecureRandom.urlsafe_base64(48))
      UserMailer.with(user: @user).welcome.deliver_now
      redirect_to welcome_users_path
    else
      render template: "users/new"
    end
  end

  def welcome; end

  def confirm
    @user = User.find_by(email_token: params[:user_id])

    if params[:user_id].present? && @user
      @user.update(confirmed_at: Time.current, email_token: nil)
      sign_in @user
      redirect_to root_path
    else
      raise ActionController::RoutingError.new('Unauthorized Parameters')
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
