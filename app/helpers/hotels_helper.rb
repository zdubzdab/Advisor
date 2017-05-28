module HotelsHelper
  def show_element_on_desired_page(current_contr_name, contr_name,
    html_element, element_name)
    content_tag(html_element.to_sym, element_name) if
    current_contr_name == contr_name
  end

  def count_rating(hotel)
    hotel.average_rating.round(2)
  end

  def get_breakfast(arg)
    if arg == true
      'yes'
    else
      'no'
    end
  end
end
