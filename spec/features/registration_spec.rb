require 'rails_helper'

feature 'Registration' do
  before do
    visit '/users/sign_in'
    click_link('Sign up')
  end

  scenario 'page' do
    expect(page).to have_link('Main page')
    expect(page).to have_link('New hotel')
    expect(page).to have_link('All hotels')
    expect(page).to have_link('Log in')
    expect(page).to have_selector('h2', text: 'Sign up')
    expect(current_path).to eq('/users/sign_up')
  end

  scenario 'go to log in page' do
    click_on 'Log in'

    expect(page).to have_selector('h2', text: 'Log in')
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'success' do
    fill_in 'Email',                  with: 'user@example.com'
    fill_in 'Password',               with: 'password'
    fill_in 'Password confirmation',  with: 'password'
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Best hotels')
    expect(current_path).to eq('/')
  end

  context 'invalid' do
    scenario 'blank email' do
      fill_in 'Email',                  with: ''
      fill_in 'Password',               with: 'password'
      fill_in 'Password confirmation',  with: 'password'
      click_on 'Sign up'

      expect(page).to have_content("Email can't be blankEmail "\
        'bad format')
      expect(current_path).to eq('/users')
    end

    scenario 'blank password' do
      fill_in 'Email',                  with: 'user@example.com'
      fill_in 'Password',               with: ''
      fill_in 'Password confirmation',  with: 'password'
      click_on 'Sign up'

      expect(page).to have_content("Password can't be blank"\
        "Password confirmation doesn't match Password")
      expect(current_path).to eq('/users')
    end

    scenario 'blank password confirmation' do
      fill_in 'Email',                  with: 'user@example.com'
      fill_in 'Password',               with: 'password'
      fill_in 'Password confirmation',  with: ''
      click_on 'Sign up'

      expect(page).to have_content("Password confirmation doesn't match"\
      ' Password')
      expect(current_path).to eq('/users')
    end

    scenario 'invalid email' do
      fill_in 'Email',                  with: 'user.gmail'
      fill_in 'Password',               with: 'password'
      fill_in 'Password confirmation',  with: 'password'
      click_on 'Sign up'

      expect(page).to have_content('Email bad format')
      expect(current_path).to eq('/users')
    end

    scenario "Password confirmation doesn't match Password" do
      fill_in 'Email',                  with: 'user@gmail.com'
      fill_in 'Password',               with: 'password'
      fill_in 'Password confirmation',  with: 'passwor'
      click_on 'Sign up'

      expect(page).to have_content("Password confirmation doesn't match"\
        ' Password')
      expect(current_path).to eq('/users')
    end
  end
end
