module HotelsHelper
  def show_element_on_desired_page(name, html_element, element_name)
    content_tag(html_element.to_sym, element_name) if controller_name == name
  end

  def show_breakfast_on_desired_page(name, html_element, element_name)
    content_tag(html_element.to_sym, get_breakfast(element_name.breakfast)) if
    controller_name == name
  end

  def count_rating(name, html_element, hotel)
    if controller_name == name
      content_tag(html_element, hotel.ratings.average(:score).to_f.round(2))
    else
      content_tag(html_element, hotel.average_rating.round(2))      
    end
  end

  private

  def get_breakfast(arg)
    if arg == false
      'yes'
    else
      'no'
    end
  end
end
