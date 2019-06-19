class TeacherSerializer < ApplicationSerializer
  attributes :certificates

  belongs_to :employer
end
