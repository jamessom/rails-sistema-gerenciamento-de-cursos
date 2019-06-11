class Enrollment < ApplicationRecord
  belongs_to :Student
  belongs_to :Grade
end
