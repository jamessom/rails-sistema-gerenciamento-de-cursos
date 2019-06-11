class RenameTableTeamsToGrades < ActiveRecord::Migration[5.2]
  def change
    rename_table :teams, :grades
    rename_column :enrollments, :teams_id, :grades_id
    remove_column :grades, :workload, :integer
  end
end
