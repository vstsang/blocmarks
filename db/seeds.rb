User.create!(email: 'standard@wiki.com', password: 'password', role: 0, confirmed_at: Time.now.utc)
User.create!(email: 'admin@wiki.com', password: 'password', role: 2, confirmed_at: Time.now.utc)
