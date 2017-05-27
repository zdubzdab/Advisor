require 'rails_helper'

describe ApplicationHelper do
  include ApplicationHelper

  describe 'show_link_depend_on_user_role method' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'show link on desired pages' do
      expect(
        show_link_depend_on_user_role(
          (link_to 'Log out', '#'), (link_to 'Log in', '#'),
          (link_to 'Sign up', '#'), @user, true)).to eq (link_to 'Log out', '#')
      expect(
        show_link_depend_on_user_role(
          (link_to 'Log out', '#'), (link_to 'Log in', '#'),
          (link_to 'Sign up', '#'), nil, true)).to eq (link_to 'Sign up', '#')
      expect(
        show_link_depend_on_user_role(
          (link_to 'Log out', '#'), (link_to 'Log in', '#'),
          (link_to 'Sign up', '#'), nil, false)).to eq (link_to 'Log in', '#')
    end
  end

  describe 'date_format method' do
    before do
      @date1 = Date.new(2001,1,1)
      @date2 = Date.new(2017,4,3)
    end

    it 'show date in desired format' do
      expect(date_format(@date1)).to eq ('01/01/2001')
      expect(date_format(@date2)).to eq ('03/04/2017')
    end
  end

  describe 'show_link_on_desired_page method' do
    it 'show link if condition is true' do
      expect(
        show_link_on_desired_page(
          (link_to 'Main page', root_path), false)).to eq (
            link_to 'Main page', root_path)
      expect(
        show_link_on_desired_page(
          (link_to 'Main page', root_path), nil)).to eq (
            link_to 'Main page', root_path)
      expect(
        show_link_on_desired_page(
          (link_to 'Main page', root_path), true)).to eq ()                     
    end
  end
end
