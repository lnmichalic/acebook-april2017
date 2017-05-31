module ApplicationHelper
  def url_checker(post)
    post.message.gsub(URI.regexp, '<a href="\0">\0</a>').html_safe
  end

  def time_and_date(post)
    post.created_at.strftime("%d/%m/%Y at %H:%M")
  end
end
