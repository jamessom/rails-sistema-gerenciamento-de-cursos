class Enrrolment < ApplicationRecord
  belongs_to :Student
  belongs_to :Team
end
