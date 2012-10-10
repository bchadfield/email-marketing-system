module ApplicationHelper
  def title(page_title)
    base_title = "Email Marketing System" 
    content_for(:title) { "#{page_title} | #{base_title}" }
    content_for(:heading) { page_title }
  end
end
