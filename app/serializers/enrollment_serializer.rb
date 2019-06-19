class EnrollmentSerializer < ApplicationSerializer
  attributes :date_enrollment

  attribute :student_name do |enrollment|
    "#{enrollment.student.name}"
  end

  attribute :grade_subject do |enrollment|
    "#{enrollment.grade.subject.name}"
  end

  belongs_to :student
  belongs_to :grade
end
