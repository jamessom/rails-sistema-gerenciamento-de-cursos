class AddEmployerRefToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :employer, foreign_key: true
  end
end
