module ApplicationHelper

  # Build page titles
  def full_title(page_title = '')
    base_title = 'playsette'
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Manage "active" class for menus
  def current_class?(test_path)
    'active' if request.path == test_path
  end

end
