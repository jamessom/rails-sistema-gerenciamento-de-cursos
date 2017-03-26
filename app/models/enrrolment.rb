class Enrrolment < ActiveRecord::Base
  belongs_to :Student
  belongs_to :Team
end
