module ApplicationHelper
  def nav_class(name, &block)
    class_name = if params[:nav] == name
      "nav active"
    else
      "nav"
    end
    content_tag(:li, :class => class_name, &block)
  end
end
