# == Schema Information
#
# Table name: employers
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  date_birth :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employer < ApplicationRecord
end
