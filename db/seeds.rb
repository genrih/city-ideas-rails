DatabaseCleaner.strategy = :truncation, { except: %w(public.schema_migrations) }
DatabaseCleaner.clean
FileUtils.rm_rf('public/uploads/.')
puts 'DB and Uploads cleared'

admin =  User.create(email: 'admin@example.com', password: 'password', first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name, role: 1 )
5.times do
  user = User.create(email:Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
  3.times do
    Idea.create(title: Faker::Hipster.sentence, description: Faker::Hipster.sentence(5),
                remote_image_url: 'http://lorempixel.com/400/400/')
  end
end
