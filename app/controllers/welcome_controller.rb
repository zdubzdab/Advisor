class WelcomeController < ApplicationController
  def index
    @hotels = Hotel.joins(:ratings)
                   .select('hotels.title, hotels.price, hotels.id, '\
                      'hotels.breakfast, avg(ratings.score) as average_rating')
                   .group('hotels.title, hotels.price, hotels.id')
                   .order('average_rating DESC')
                   .limit(5)
  end
end
