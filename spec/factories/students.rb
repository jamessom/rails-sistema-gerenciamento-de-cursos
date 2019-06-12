FactoryBot.define do
  factory :fake_students, class: Student do
    name { Faker::Name.name }
    cpf { Faker::Number.number(11) }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    date_birth { Faker::Date.birthday(18, 65) }
  end
end