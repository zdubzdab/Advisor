5.times do |n|
  email = "user#{n+1}@gmail.com"
  password = 'password'
  User.create_with(password: password).find_or_create_by(email: email)
end

10.times do |n|
  title  = "Hotel№#{n+1}"
  description = "This is hotel #{n+1}"
  price = rand(100..1000)
  breakfast = [true, false].sample
  Hotel.create_with(description: description,
    price: price, breakfast: breakfast).find_or_create_by(title: title)
end

Hotel.last(10).each do |h|
  country = 'Country'
  state = 'State'
  city = 'City'
  street = "Street№#{h.id}"
  Address.create_with(hotel_id: h.id, country: country,
    state: state, city: city).find_or_create_by(street: street)
end

Hotel.last(10).each do |h|
  User.last(3).each do |u|
    value =  [1,2,3,4,5].sample
    Rating.create!(hotel_id: h.id, user_id: u.id, score: value)
  end
end

Hotel.last(10).each do |h|
  avatar = File.open(Rails.root + 'app/assets/images/image.png')
  Image.create!(hotel_id: h.id, photos: [avatar])
end
