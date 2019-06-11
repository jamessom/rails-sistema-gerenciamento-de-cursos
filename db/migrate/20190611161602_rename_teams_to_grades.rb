class RenameTeamsToGrades < ActiveRecord::Migration[5.2]
  def change
    rename_table :teams, :grades
    rename_column :enrollments, :teams_id, :grades_id
    rename_column :grades, :trainers_id, :teachers_id
    remove_column :grades, :workload, :integer
  end
end
