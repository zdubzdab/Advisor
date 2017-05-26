require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it { should validate_presence_of(:description) }
end
