require 'rails_helper'

describe HotelsHelper do
  include HotelsHelper

  describe 'show_element_on_desired_page method' do
    it 'show link' do
      expect(show_element_on_desired_page(
        'hotels', 'hotels', 'th', 'Breakfast')).to eq (content_tag(
          :th, 'Breakfast'))
    end

    it 'doesnt show link' do
      expect(
        show_element_on_desired_page('/', 'hotels', 'th', 'Breakfast')).to eq ()
      expect(
        show_element_on_desired_page(
          '/hotels/1', 'hotels', 'th', 'Breakfast')).to eq ()
    end
  end

  describe 'show_breakfast_on_desired_page method' do
    before do
      user = FactoryGirl.create(:user)
      @hotel1 = FactoryGirl.create(:hotel, user: user, breakfast: true,
        title: 'true')
      @hotel2 = FactoryGirl.create(:hotel, user: user, breakfast: false,
        title: 'false')
    end

    it 'show' do
      expect(
        show_breakfast_on_desired_page('hotels', 'hotels', 'td', @hotel1)).to eq (
        content_tag(:td, 'yes'))
      expect(
        show_breakfast_on_desired_page('hotels', 'hotels', 'td', @hotel2)).to eq (
        content_tag(:td, 'no'))
    end

    it 'doesnt show' do
      expect(
        show_breakfast_on_desired_page('/', 'hotels', 'td', @hotel1)).to eq ()
      expect(
        show_breakfast_on_desired_page(
          'hotels/1', 'hotels', 'td', @hotel2)).to eq ()
    end
  end

  describe 'count_rating method' do
    before do
      user = FactoryGirl.create(:user)
      @hotel = FactoryGirl.create(:hotel, user: user, breakfast: true,
        title: 'true')
      FactoryGirl.create(:rating, hotel: @hotel, user: user, score: 4.0)
      FactoryGirl.create(:rating, hotel: @hotel, user: user, score: 2.0)
    end

    it 'show desired rating' do
      expect(count_rating('hotels', 'hotels', 'td', @hotel)).to eq (
        content_tag(:td, 3.0))
    end
  end

  describe 'get_breakfast method' do
    it 'show if breakfast included' do
      expect(get_breakfast(true)).to eq ('yes')
      expect(get_breakfast(false)).to eq ('no')
      expect(get_breakfast(nil)).to eq ('no')
    end
  end
end
