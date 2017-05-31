module ApplicationHelper
  def url_checker(post)
    post.gsub(URI.regexp, '<a href="\0">\0</a>').html_safe
  end

  def post_presenter(post)
    simple_format("#{url_checker(post.message)}<br>Posted on #{post.created_at.strftime("%d/%m/%Y")} at #{post.created_at.strftime("%H:%M")}")
  end
end
