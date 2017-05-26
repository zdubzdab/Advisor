module ApplicationHelper
  def show_link_depend_on_user_role(logout, login, signup)
    if current_user
      logout
    else
      hide_link_on_some_pages(login, signup)
    end
  end

  def date_format(date)
    date.strftime('%d/%m/%G')
  end

  def show_link_on_desired_page(link, page)
    link unless current_page?(page)
  end

  private

  def hide_link_on_some_pages(login, signup)
    if current_page?('/users/sign_in')
      signup
    else
      login      
    end
  end
end
