class RenameTeamsToGrades < ActiveRecord::Migration[5.2]
  def change
    rename_table :teams, :grades
    rename_column :enrollments, :team_id, :grade_id
    rename_column :grades, :trainer_id, :teacher_id
    remove_column :grades, :workload, :integer
  end
end
