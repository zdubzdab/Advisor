class WelcomeController < ApplicationController
  def index
    @hotels = Hotel.joins(:ratings)
                   .page(params[:page])
                   .per(Hotel::WELCOME_INDEX_PAGE)
                   .select('hotels.title, hotels.price, hotels.id, '\
                      'avg(ratings.score) as average_rating')
                   .group('hotels.title, hotels.price, hotels.id')
                   .order('average_rating DESC')
                   .includes(:address)
                   .limit(5)
  end
end
