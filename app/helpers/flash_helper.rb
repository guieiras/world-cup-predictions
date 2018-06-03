module FlashHelper
  def flash_notification_script
    flashes = []
    [:alert, :info, :success, :error].each do |type|
      flashes << [type, flash[type]] if flash[type].present?
    end

    if flashes.any?
      script = flashes.reduce('') { |memo, f| memo + "toastr.#{f[0]}('#{j(f[1])}');" }

      "<script>$(document).ready(function() { #{script} })</script>".html_safe
    end
  end
end
