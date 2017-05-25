class WelcomeController < ApplicationController
  def index
    @hotels = Hotel.order('created_at ASC')
                   .page(params[:page])
                   .per(Hotel::HOTEL_INDEX_PAGE)
  end
end
