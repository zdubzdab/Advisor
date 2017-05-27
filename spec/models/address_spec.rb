require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:street) }
end
