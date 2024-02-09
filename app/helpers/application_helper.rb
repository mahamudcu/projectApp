module ApplicationHelper
  def set_active(actions = [], controllers = [])
    (actions.include?(action_name) && controllers.include?(controller_name)) ? 'active' : ''
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true,   positionClass: 'toast-bottom-right' })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def pdf_assets(path, options = {})
    if path.split('/').length > 1
      image_tag "file://#{path}", options
    else
      image_tag "file://#{Rails.root.join('app', 'assets', 'images', path)}", options
    end
  end
end
