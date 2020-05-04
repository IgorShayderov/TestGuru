module ApplicationHelper
  GITHUB_LINK = "https://github.com".freeze

  CONTEXTUAL_CLASSES = {
    "alert" => "danger",
  }

  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    "#{GITHUB_LINK}/#{author}/#{repo}"
  end

  def flash_contextual_class(key)
    CONTEXTUAL_CLASSES[key] || "success"
  end

end
