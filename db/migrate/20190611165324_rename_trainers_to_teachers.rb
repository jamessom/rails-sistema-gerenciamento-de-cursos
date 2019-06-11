class RenameTrainersToTeachers < ActiveRecord::Migration[5.2]
  def change
    rename_table :trainers, :teachers
    remove_column :teachers, :name, :string
    remove_column :teachers, :email, :string
  end
end
