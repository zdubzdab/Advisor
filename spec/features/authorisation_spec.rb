require 'rails_helper'

feature 'Authorisation' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit root_path
    click_on 'Log in'
  end

  scenario 'page' do
    expect(page).to have_content('Advisor')
    expect(page).to have_content('Log in')
    expect(current_path).to eq('/users/sign_in')
  end

  it 'should have the right links on the layout' do
    click_link 'Main page'
    expect(page).to have_selector('h3', text: 'Best hotels')
    expect(current_path).to eq('/')

    click_link 'New hotel'
    expect(page).to have_content('You need to sign in or sign up before'\
      ' continuing.')
    expect(current_path).to eq('/users/sign_in')

    click_link 'All hotels'
    expect(page).to have_selector('h3', text: 'All hotels')
    expect(current_path).to eq('/hotels')

    visit('/users/sign_in')
    click_link 'Sign up'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(current_path).to eq('/users/sign_up')
  end

  scenario 'success' do
    fill_in 'Email',                  with: user.email
    fill_in 'Password',               with: user.password
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Best hotels')
    expect(page).to have_link('Log out')
    expect(current_path).to eq('/')
  end

  context 'invalid' do
    scenario 'email' do
      fill_in 'Email',                  with: ''
      fill_in 'Password',               with: user.password
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password.')
      expect(current_path).to eq('/users/sign_in')
    end

    scenario 'password' do
      fill_in 'Email',                  with: user.email
      fill_in 'Password',               with: ''
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password.')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  scenario 'log out' do
    fill_in 'Email',                  with: user.email
    fill_in 'Password',               with: user.password
    click_on 'Log in'
    click_on 'Log out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Best hotels')
    expect(page).to have_link('Log in')
    expect(current_path).to eq('/')
  end
end
