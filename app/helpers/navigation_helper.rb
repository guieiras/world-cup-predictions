module NavigationHelper
  def menu_header_for text
    content_tag(:li, text, class: "header")
  end

  def menu_item_for path, icon:, text:
    content_tag(:li, class: "#{'active' if current_page?(path)}") do
      link_to path do
        content_tag('i', '', class: "fa fa-#{icon}") +
        content_tag('span', text)
      end
    end
  end
end
