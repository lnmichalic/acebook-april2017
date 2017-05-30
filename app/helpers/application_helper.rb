module ApplicationHelper
  def url_checker(post)
    simple_format(post).gsub(URI.regexp, '<a href="\0">\0</a>').html_safe
  end

end
