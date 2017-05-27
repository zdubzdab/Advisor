require 'rails_helper'

feature 'Hotel creation' do
  scenario 'by guest' do
    visit '/'
    click_on 'New hotel'

    expect(page).to have_content('You need to sign in or sign up before'\
    ' continuing.')
    expect(current_path).to eq('/users/sign_in')
  end

  context 'by user' do
    let(:user) { FactoryGirl.create(:user) }
      
    before do
      log_in user
      visit '/hotels/new'
    end

    scenario 'page description' do
      expect(page).to have_content('Advisor')
      expect(page).to have_selector('h3', text: 'New hotel')
      expect(page).to have_link('Main page')
      expect(page).to have_link('All hotels')
      expect(page).to have_link('Log out')
    end

    it 'should have the right links' do
      click_link 'Back'
      expect(page).to have_selector('h3', text: 'Best hotels')
      expect(current_path).to eq('/')
    end

    context 'invalid' do 
      scenario 'title already taken' do
        hotel = FactoryGirl.create(:hotel, user: user)

        fill_in 'Title',              with: "#{hotel.title}"
        fill_in 'Description',        with: 'Description'
        fill_in 'Price',              with: 200
        fill_in 'Country',            with: 'Description'
        fill_in 'State',              with: 'Description'
        fill_in 'City',               with: 'Description'
        fill_in 'Street',             with: 'Description'
        page.attach_file('hotel[images_attributes][0][photos][]', Rails.root +
          'spec/assets/images.png')
        click_on 'Create Hotel'

        expect(page).to have_content('Titlehas already been taken')
      end

      scenario 'blank title description price' do
        fill_in 'Title',              with: ''
        fill_in 'Description',        with: ''
        fill_in 'Price',              with: ''

        fill_in 'Country',            with: 'Description'
        fill_in 'State',              with: 'Description'
        fill_in 'City',               with: 'Description'
        fill_in 'Street',             with: 'Description'
        page.attach_file('hotel[images_attributes][0][photos][]', Rails.root +
          'spec/assets/images.png')
        click_on 'Create Hotel'

        expect(page).to have_content("Titlecan't be blank * Description"\
          "can't be blank * Pricecan't be blank")
      end

      scenario 'blank Country State City Street' do
        fill_in 'Title',              with: 'Title'
        fill_in 'Description',        with: 'Description'
        fill_in 'Price',              with: 10

        fill_in 'Country',            with: ''
        fill_in 'State',              with: ''
        fill_in 'City',               with: ''
        fill_in 'Street',             with: ''
        page.attach_file('hotel[images_attributes][0][photos][]', Rails.root +
          'spec/assets/images.png')
        click_on 'Create Hotel'

        expect(page).to have_content("Countrycan't be blank * Statecan't"\
          " be blank * Citycan't be blank * Streetcan't be blank")
      end
    end

    scenario 'successful' do
      fill_in 'Title',              with: 'Title'
      fill_in 'Description',        with: 'Description'
      fill_in 'Price',              with: 10

      fill_in 'Country',            with: 'Country'
      fill_in 'State',              with: 'Country'
      fill_in 'City',               with: 'Country'
      fill_in 'Street',             with: 'Country'
      page.attach_file('hotel[images_attributes][0][photos][]', Rails.root +
        'spec/assets/images.png')
      click_on 'Create Hotel'

      expect(page).to have_content('Hotel was successfully created.')
      expect(current_path).to eq('/')
    end
  end
end
