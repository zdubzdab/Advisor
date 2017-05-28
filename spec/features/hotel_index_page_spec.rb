require 'rails_helper'

feature 'Hotel index page' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    hotel1 = FactoryGirl.create(:hotel, user: user, title: 'Paradise')
    FactoryGirl.create(:address, hotel: hotel1)
    FactoryGirl.create(:rating, hotel: hotel1, user: user, score: 4)

    hotel2 = FactoryGirl.create(:hotel, user: user, title: 'Chaika')
    FactoryGirl.create(:address, hotel: hotel2)
    FactoryGirl.create(:rating, hotel: hotel2, user: user, score: 5)

    hotel3 = FactoryGirl.create(:hotel, user: user, title: 'Adverty')
    FactoryGirl.create(:address, hotel: hotel3)
    FactoryGirl.create(:rating, hotel: hotel3, user: user, score: 5)

    hotel4 = FactoryGirl.create(:hotel, user: user, title: 'Stone')
    FactoryGirl.create(:address, hotel: hotel4)
    FactoryGirl.create(:rating, hotel: hotel4, user: user, score: 1)

    hotel5 = FactoryGirl.create(:hotel, user: user, title: 'Lviv')
    FactoryGirl.create(:address, hotel: hotel5)
    FactoryGirl.create(:rating, hotel: hotel5, user: user, score: 2)

    hotel6 = FactoryGirl.create(:hotel, user: user, title: 'Best')
    FactoryGirl.create(:address, hotel: hotel6)
    FactoryGirl.create(:rating, hotel: hotel6, user: user, score: 1)

    visit '/hotels'
  end

  context 'for guests' do
    scenario 'page description' do
      expect(page).to have_link('Main page')
      expect(page).to have_link('Log in')
      expect(page).to have_link('New hotel')
      expect(page).to have_content('Advisor')
      expect(page).to have_selector('h3', text: 'All hotels')
    end

    it 'should have the right links' do
      click_link('Show', match: :first)
      expect(page).to have_button('Create Comment')
      expect(page).to have_content('Hotel name: Best')
      expect(page).to have_link('Back')

      visit '/hotels'
      click_link 'Back'
      expect(page).to have_selector('h3', text: 'Best hotels')
      expect(current_path).to eq('/')
    end

    scenario 'hotels should be in required sequence' do
      hotel_names = page.all('td#hotel_titles').map(&:text)
      expect(hotel_names).to eq ['Best', 'Lviv', 'Stone', 'Adverty',
        'Chaika', 'Paradise']
    end
  end

  context 'for signed in users' do
    before do
      log_in user
      visit ('/hotels')
    end

    scenario 'description' do
      expect(page).to have_content('Advisor')
      expect(page).to have_selector('h3', text: 'All hotels')
      expect(page).to have_link('Main page')
      expect(page).to have_link('New hotel')
      expect(page).to have_link('Log out')
    end

    it 'should have the right links' do
      visit '/hotels'
      click_link('Show', match: :first)
      expect(page).to have_button('Create Comment')
      expect(page).to have_content('Hotel name: Best')
      expect(page).to have_link('Back')

      visit '/hotels'
      click_link 'Back'
      expect(page).to have_selector('h3', text: 'Best hotels')
      expect(current_path).to eq('/')
    end

    scenario 'hotels should be in required sequence' do
      hotel_names = page.all('td#hotel_titles').map(&:text)
      expect(hotel_names).to eq ['Best', 'Lviv', 'Stone', 'Adverty',
        'Chaika', 'Paradise']
    end
  end
end
