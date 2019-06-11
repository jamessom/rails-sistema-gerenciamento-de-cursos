class RenameCoursesToSubjects < ActiveRecord::Migration[5.2]
  def change
    rename_table :courses, :subjects
    rename_column :grades, :courses_id, :subjects_id
    rename_column :subjects, :requiriment, :requirement
  end
end
