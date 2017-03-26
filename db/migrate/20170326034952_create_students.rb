class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :cpf
      t.string :email
      t.string :phone
      t.date :date_birth

      t.timestamps null: false
    end
  end
end
