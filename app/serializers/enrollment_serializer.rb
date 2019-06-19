class EnrollmentSerializer < ApplicationSerializer
  attributes :date_enrollment

  belongs_to :student
  belongs_to :grade
end
