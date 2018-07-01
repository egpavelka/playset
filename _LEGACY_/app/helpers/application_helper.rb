module ApplicationHelper
  # Build page titles
  def full_title(page_title = '')
    base_title = 'playsette'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # Manage "active" class for menus
  def current_class?(test_path)
    'active' if request.path == test_path
  end
end

def flash_class(level)
  case level
  when :notice then 'alert alert-info'
  when :success then 'alert alert-success'
  when :error then 'alert alert-error'
  when :alert then 'alert alert-error'
  end
end
