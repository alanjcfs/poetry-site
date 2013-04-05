module ApplicationHelper
  def flash_notice
    if params[:notice]
      content_tag(:p, params[:notice], class: 'alert')
    end
  end
end
