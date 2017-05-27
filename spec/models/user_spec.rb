require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should_not allow_value("test@test").for(:email) }
  it { should_not allow_value("test@test.").for(:email) }
  it { should_not allow_value("test_test.com").for(:email) }


  it { should validate_confirmation_of(:password) }
end
