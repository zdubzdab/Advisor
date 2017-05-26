class HotelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @hotels = Hotel.order('created_at DESC')
                   .page(params[:page])
                   .per(Hotel::HOTEL_INDEX_PAGE)
                   .includes(:address)
  end

  def show
    @hotel = Hotel.find(params[:id])
    @comment = Comment.new
    @comments = @hotel.comments
                      .order('created_at ASC')
                      .page(params[:page])
                      .per(Hotel::HOTEL_COMMENT_SHOW_PAGE)
                      .includes(:user)
    @images = @hotel.images
    @avg_rating = @hotel.ratings.average(:score).round(2) if @hotel.ratings.any?
  end

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

  def hotel_params
    params.require(:hotel).permit(:title, :description, :price, :breakfast,
                                  :user_id, address_attributes:
                                  [:id, :country, :state, :city, :street],
                                  images_attributes: [:id, { photos: [] }])
  end
end
