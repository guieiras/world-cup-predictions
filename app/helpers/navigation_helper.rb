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

  def submenu_for options, icon:, text:
    active = false
    active = true if options[:controller] && controller_name == options[:controller]
    active = true if options[:path] && current_page?(options)

    content_tag(:li, class: "treeview #{'menu-open' if active}") do
      (link_to '#' do
        content_tag('i', '', class: "fa fa-#{icon}") +
        content_tag('span', text) +
        content_tag('span', class: "pull-right-container") do
          content_tag('i', '', class: "fa fa-angle-left pull-right")
        end
      end) +
      content_tag('ul', class: "treeview-menu", style: "#{'display: block;' if active}") do
        yield
      end
    end
  end
end
