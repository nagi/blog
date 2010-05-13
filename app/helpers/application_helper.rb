# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nav_button_class(button,title)
    if title.downcase.include?(button.downcase)
      "selected"
    else
      "tab"
    end
  end
end
