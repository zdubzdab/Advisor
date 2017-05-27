module ApplicationHelper
  def show_link_depend_on_user_role(logout, login, signup, cur_user, condition)
    if cur_user
      logout
    else
      hide_link_on_some_pages(login, signup, condition)
    end
  end

  def date_format(date)
    date.strftime('%d/%m/%G')
  end

  def show_link_on_desired_page(link, condition)
    link unless condition
  end

  private

  def hide_link_on_some_pages(login, signup, condition)
    if condition
      signup
    else
      login
    end
  end
end
