class EmailConfirmationGuard < Clearance::SignInGuard
  def call
    if unconfirmed?
      failure(I18n.t('flashes.failure_when_email_is_not_confirmed'))
    else
      next_guard
    end
  end

  def unconfirmed?
    signed_in? && !current_user.confirmed_at
  end
end