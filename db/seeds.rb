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
    title: Faker::ProgrammingLanguage.name
  )

  rand(8..16).times do
    @topic.bookmarks.create!(
      url: Faker::Internet.url,
      user_id: rand(1..(User.count))
    )
  end
end

(1..(Bookmark.count*(1)).round).each do
  Like.create!(
    user_id: rand(1..4),
    bookmark_id: rand(1..(Bookmark.count))
  )
end
