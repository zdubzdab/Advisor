class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show]

  def index
    @hotels = Hotel.all
  end

  def show; end

  def new
    @hotel = Hotel.new
    @hotel.build_address
    @hotel.images.build
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user = current_user

    if @hotel.save
      redirect_to root_path, notice: 'Hotel was successfully created.'
    else
      @hotel.images.build if @hotel.images.blank?
      render 'new'
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:title, :description, :price, :breakfast,
                                  :user_id, address_attributes:
                                  [:id, :country, :state, :city, :street],
                                  images_attributes: [:id, { photos: [] }])
  end
end
