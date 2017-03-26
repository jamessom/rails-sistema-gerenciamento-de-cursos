class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.integer :hour_value
      t.string :certificates

      t.timestamps null: false
    end
  end
end
