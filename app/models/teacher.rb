# == Schema Information
#
# Table name: teachers
#
#  id           :bigint           not null, primary key
#  hour_value   :integer
#  certificates :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employer_id  :bigint
#

class Teacher < ApplicationRecord
    belongs_to :employer
end
