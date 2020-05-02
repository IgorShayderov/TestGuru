module SessionsHelper

  def flash_message(type)
    content_tag :div, flash[type], class: "alert alert-danger" if flash[type]
  end

end
