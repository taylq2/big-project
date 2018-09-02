module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    return base_title if page_title.empty?
    page_title + " | " + base_title
  end

  def status_choice
    Order.statuses.keys.map{|status| [t("#{status}"), status]}
  end
end
