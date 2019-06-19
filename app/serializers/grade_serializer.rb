class GradeSerializer < ApplicationSerializer
  attributes :initial_date, :end_date

  belongs_to :teacher
  belongs_to :subject
end
