class ProfileController < ApplicationController
  def edit
    raise ActionController::RoutingError.new('Unauthorized Edit') unless params[:id] == 'me'
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name))
      flash[:success] = I18n.t('profile.actions.updated')
      redirect_to edit_profile_path(:me)
    else
      flash[:error] = I18n.t('profile.actions.not_updated')
      render :edit
    end
  end
end
