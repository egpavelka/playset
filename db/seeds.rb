# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(name:  "Grace Pavelka",
             username: "egpavelka",
             email: "test@newtestemail.com",
             password: "TestPassword1",
             password_confirmation: "TestPassword1",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = "Test User"
  username = "new_test_user#{n+1}"
  email = "test_#{n+1}@newtestemail.com"
  password = "TestPassword1"
  User.create!(name: name,
              username: username,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

# Track.create!(title: "Song Title",
#               artist: "Artist",
#               album: "Album",
#               year: "1996",
#               kind: "Upload",
#               user_id: "1"
#               )
