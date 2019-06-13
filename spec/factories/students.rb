# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  cpf        :string
#  name       :string
#  email      :string
#  phone      :string
#  date_birth :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :fake_students, class: Student do
    name { Faker::Name.name }
    cpf { Faker::Number.number(11) }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    date_birth { Faker::Date.birthday(18, 65) }
  end
end
