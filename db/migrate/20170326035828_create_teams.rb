class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :Trainer, index: true, foreign_key: true
      t.references :Course, index: true, foreign_key: true
      t.datetime :initial_date
      t.datetime :end_date
      t.integer :workload

      t.timestamps null: false
    end
  end
end
