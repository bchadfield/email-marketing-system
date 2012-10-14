module ApplicationHelper
  def title(page_title)
    base_title = "Email Marketing System" 
    content_for(:title) { "#{page_title} | #{base_title}" }
    content_for(:heading) { page_title }
  end
  
  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{set_class(sort_direction)}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}  
  end
  
  private
    
    def set_class(direction)
      sort_direction == "asc" ? "icon-arrow-up" : "icon-arrow-down" 
    end
end
