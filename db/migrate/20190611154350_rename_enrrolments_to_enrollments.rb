class RenameEnrrolmentsToEnrollments < ActiveRecord::Migration[5.2]
  def change
    rename_table :enrrolments, :enrollments
    rename_column :enrollments, :date_enrrolment, :date_enrollment
  end
end
