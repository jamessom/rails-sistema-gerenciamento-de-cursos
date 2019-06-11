# Students
(0..5).each do
  Student.create({
    cpf: Faker::Number.number(11),
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    date_birth: Faker::Date.birthday(18, 65)
  })
end