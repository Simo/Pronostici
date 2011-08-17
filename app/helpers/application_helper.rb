module ApplicationHelper
	
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def flash_messages
    %w(notice warning error).each do |msg|
      concat content_tag(:div, content_tag(:p, flash[msg.to_sym]),
        :class => "#{msg}") unless flash[msg.to_sym].blank?
    end
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
	
end
