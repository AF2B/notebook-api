namespace :dev do
  desc 'Configure development environment'
  puts 'Loading...'
  task setup: :environment do
    puts 'Reseting database...'
    `rails db:drop db:create db:migrate`
    puts 'Done database!'

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

    puts 'Creating phones...'
    Contact.all.each do |contact|
      3.times do
        Phone.create!(
          number: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts 'Phones created!'

    puts 'Creating addresses...'
    Contact.all.each do |contact|
      contact.create_address(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts 'Addresses created!'
  end
end
