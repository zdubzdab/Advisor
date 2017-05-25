module HotelsHelper
  def breakfast(include)
    if include == false
      include = "yes"
    else
      include = "no"
    end
  end
end
