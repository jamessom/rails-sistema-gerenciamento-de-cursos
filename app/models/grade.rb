# == Schema Information
#
# Table name: grades
#
#  id           :bigint           not null, primary key
#  teachers_id  :bigint
#  subjects_id  :bigint
#  initial_date :datetime
#  end_date     :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Grade < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
end
