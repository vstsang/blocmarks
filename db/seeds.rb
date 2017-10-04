User.create!(email: 'standard@blocmarks.com', password: 'password', role: 0, confirmed_at: Time.now.utc)
User.create!(email: 'admin@blocmarks.com', password: 'password', role: 2, confirmed_at: Time.now.utc)

5.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: 'password',
    role: Faker::Number.between(0, 2),
    confirmed_at: Time.now.utc
  )
end

5.times do
  @topic = Topic.create!(
    title: Faker::StarWars.character,
    user_id: rand(User.count)
  )

  rand(4..8).times do
    @topic.bookmarks.create!(
      url: Faker::Internet.url,
    )
  end

end
