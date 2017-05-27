require 'rails_helper'

feature 'Hotels show page' do
  context 'for user' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      @hotel = FactoryGirl.create(:hotel, user: user, title: 'Paradise')
      FactoryGirl.create(:address, hotel: @hotel)
      log_in user
      visit "/hotels/#{@hotel.id}"
    end

    scenario 'page description' do
      expect(page).to have_link('Main page')
      expect(page).to have_link('New hotel')
      expect(page).to have_link('All hotels')
      expect(page).to have_link('Log out')
      expect(page).to have_content("#{@hotel.title}")
      expect(page).to have_content("#{@hotel.description}")
      expect(page).to have_content("#{@hotel.price}")
      expect(page).to have_content("#{@hotel.country}")
      expect(page).to have_content("#{@hotel.state}")
      expect(page).to have_content("#{@hotel.city}")
      expect(page).to have_content("#{@hotel.street}")
      expect(page).to have_selector('h3', text: 'Photos')
      expect(page).to have_link('Vote')
    end

    it 'should have the right links' do
      click_link 'Back'
      expect(page).to have_selector('h3', text: 'Best hotels')
      expect(current_path).to eq('/')
    end

    context 'create comment' do
      scenario 'success' do
        fill_in 'comment[text]', with: 'Great'
        click_on 'Create Comment'

        expect(page).to have_content('Great')
        expect(page).to have_content('Comment was successfully created.')
      end

      scenario 'invalid' do
        fill_in 'comment[text]', with: ''
        click_on 'Create Comment'

        expect(page).to have_content("Text of comment can't be blank.")
      end
    end
  end

  context 'for guest' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      @hotel = FactoryGirl.create(:hotel, user: user, title: 'Paradise')
      FactoryGirl.create(:address, hotel: @hotel)
      visit "/hotels/#{@hotel.id}"
    end

    scenario 'page description' do
      expect(page).to have_link('Main page')
      expect(page).to have_link('New hotel')
      expect(page).to have_link('All hotels')
      expect(page).to have_link('Log in')
      expect(page).to have_content("#{@hotel.title}")
      expect(page).to have_content("#{@hotel.description}")
      expect(page).to have_content("#{@hotel.price}")
      expect(page).to have_content("#{@hotel.country}")
      expect(page).to have_content("#{@hotel.state}")
      expect(page).to have_content("#{@hotel.city}")
      expect(page).to have_content("#{@hotel.street}")
      expect(page).to have_selector('h3', text: 'Photos')
      expect(page).not_to have_link('Vote')
    end

    it 'should have the right links' do
      click_link 'Back'
      expect(page).to have_selector('h3', text: 'Best hotels')
      expect(current_path).to eq('/')
    end

    scenario 'try to create comment' do
      fill_in 'comment[text]', with: 'Great'
      click_on 'Create Comment'

      expect(page).to have_content('You need to sign in or sign up before'\
      ' continuing.')
      expect(current_path).to eq('/users/sign_in')
    end
  end
end
