namespace :dev do
  desc 'Configure development environment'
  puts 'Loading...'
  task setup: :environment do
    kind_contacts = %w[Friend Family Work]

    puts 'Creating kinds...'
    kind_contacts.each do |contact|
      Kind.create!(description: contact)
    end
    puts 'Kinds created!'

    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    puts 'Done!'
  end
end
