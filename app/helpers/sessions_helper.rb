module SessionsHelper

  def flash_message(type)
    contextual_class = {
      alert: "danger",
      success: "success",
    }

    content_tag :div, flash[type], class: "alert alert-#{contextual_class[type]}" if flash[type]
  end

end
