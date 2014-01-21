module ApplicationHelper

  # All of this code allows me to have the account forms as partials in other views
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current_page' : ''
    link_to link_text, link_path, class: class_name
  end
end
