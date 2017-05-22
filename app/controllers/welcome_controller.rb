class WelcomeController < ApplicationController
  def index
    @hotels = Hotel.all
  end
end
