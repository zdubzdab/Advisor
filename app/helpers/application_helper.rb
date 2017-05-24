module ApplicationHelper
  def hide_link_to_main_page(link)
    link unless current_page?('/')
  end

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

  private

    def hide_link_on_some_pages(login, signup)
      if request.original_url.split('/').last == 'sign_in'
        signup
      else
        login
      end
    end
end
