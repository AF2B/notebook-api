namespace :dev do
  desc 'Configure development environment'
  puts 'Loading...'
  task setup: :environment do
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65)
      )
    end
    puts 'Done!'

    kind_contacts = %w[Friend Family Colleague Work]

    puts 'Creating kinds...'
    kind_contacts.each do |contact|
      Kind.create!(description: contact)
    end
    puts 'Kinds created!'
  end
end
