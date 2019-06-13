# == Schema Information
#
# Table name: enrollments
#
#  id              :bigint           not null, primary key
#  date_enrollment :datetime
#  students_id     :bigint
#  grades_id       :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :grade
end
