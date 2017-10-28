User.create!(email: 'standard@blocmarks.com', password: 'password', role: 0, confirmed_at: Time.now.utc)
User.create!(email: 'admin@blocmarks.com', password: 'password', role: 2, confirmed_at: Time.now.utc)
sites = [
  "http://github.com",
  "http://cnn.com",
  "http://slashdot.com",
  "http://bloc.io",
  "http://microsoft.com",
  "http://google.com",
  "http://youtube.com",
  "http://wikipedia.org",
  "http://facebook.com",
  "http://piedpiper.com",
  "http://twitter.com",
  "http://amazon.com"
]

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

  rand(3..(sites.count)).times do
    @topic.bookmarks.create!(
      url: sites[rand(sites.count)],
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
