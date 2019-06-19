# Subjects
(0..5).each do
  Subject.create({
    name: Faker::ProgrammingLanguage.name,
    requirement: Faker::Lorem.sentence(3),
    workload: Faker::Number.between(10, 100),
    price: Faker::Commerce.price
  })
end

# Employer
(0..5).each do
  Employer.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    date_birth: Faker::Date.birthday(18, 65)
  })
end

# Teachers
(0..5).each do
  employer = Employer.find(Employer.ids.sample)
  Teacher.create({
    hour_value: Faker::Commerce.price,
    certificates: Faker::ProgrammingLanguage.name,
    employer_id: employer.id
  })
end

# Grades
(0..5).each do
  Grade.create({
    teacher_id: Teacher.find(Teacher.ids.sample).id,
    subject_id: Subject.find(Subject.ids.sample).id,
    initial_date: Faker::Date.between_except(1.year.ago, 6.months.from_now, Date.today),
    end_date: Faker::Date.between_except(1.year.ago, 6.months.from_now, Date.today)
  })
end

# Students
(0..5).each do
  Student.create({
    name: Faker::Name.name,
    cpf: Faker::Number.number(11),
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    date_birth: Faker::Date.birthday(18, 65)
  })
end

# Enrollments
(0..5).each do
  Enrollment.create({
    date_enrollment: Faker::Time.between(2.days.ago, Time.now, :all),
    student_id: Student.find(Student.ids.sample).id,
    grade_id: Grade.find(Grade.ids.sample).id
  })
end