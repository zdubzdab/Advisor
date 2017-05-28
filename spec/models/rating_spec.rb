require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should validate_presence_of(:score) }
  it { should allow_value(4).for(:score).on(:create) }
  it { should_not allow_value(7).for(:score).on(:create) }
  it { should_not allow_value(-3).for(:score).on(:create) }
end
