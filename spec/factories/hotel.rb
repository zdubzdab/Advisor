FactoryGirl.define do
  factory :hotel do
    title         'Dream'
    description   'Rooms are tidy.'
    price          22
    breakfast      true
    user_id        1
  end
end
