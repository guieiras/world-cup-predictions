module FlashHelper
  TYPES = {
    alert: :warning,
    danger: :error,
    error: :error,
    notice: :warning,
    info: :info,
    success: :success,
    warning: :warning
  }.freeze

  def flash_notification_script
    flashes = []
    TYPES.keys.each do |type|
      flashes << [TYPES[type], flash[type]] if flash[type].present?
    end

    if flashes.any?
      script = flashes.reduce('') { |memo, f| memo + "toastr.#{f[0]}('#{j(f[1])}');" }

      "<script>$(document).ready(function() { #{script} })</script>".html_safe
    end
  end
end
