module ApplicationHelper
  def currentpage(controller)
    "current" if params[:controller] == controller
  end
end
