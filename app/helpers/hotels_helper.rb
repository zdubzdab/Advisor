module HotelsHelper
  def show_element_on_desired_page(current_contr_name, contr_name,
    html_element, element_name)
    content_tag(html_element.to_sym, element_name) if
    current_contr_name == contr_name
  end

  def show_breakfast_on_desired_page(current_contr_name, contr_name,
      html_element, element_name)
    content_tag(html_element.to_sym, get_breakfast(element_name.breakfast)) if
    current_contr_name == contr_name
  end

  def count_rating(current_contr_name, contr_name, html_element, hotel)
    if current_contr_name == contr_name
      content_tag(html_element, hotel.ratings.average(:score).to_f.round(2))
    else
      content_tag(html_element, hotel.average_rating.round(2))
    end
  end

  def get_breakfast(arg)
    if arg == true
      'yes'
    else
      'no'
    end
  end
end
