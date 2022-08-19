namespace :setup2 do
  desc 'Configure phones to contacts'
  task :phones do
    Contact.all.each do |contact|
      Phone.create!(
        number: Faker::PhoneNumber.phone_number,
        contact: contact
      )
    end
  end
end
