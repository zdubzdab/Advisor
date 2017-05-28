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

  describe 'get_breakfast method' do
    it 'show if breakfast included' do
      expect(get_breakfast(true)).to eq ('yes')
      expect(get_breakfast(false)).to eq ('no')
      expect(get_breakfast(nil)).to eq ('no')
    end
  end
end
