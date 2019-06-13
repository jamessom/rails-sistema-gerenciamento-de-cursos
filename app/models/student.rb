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

class Student < ApplicationRecord
end
