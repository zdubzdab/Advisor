module RatingsHelper
  def average_rating(rate)
    if rate == nil
      rate = 0
    else
      rate.round(2)
    end
  end
end
