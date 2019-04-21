class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :trainers, index: true, foreign_key: true
      t.references :courses, index: true, foreign_key: true
      t.datetime :initial_date
      t.datetime :end_date
      t.integer :workload

      t.timestamps null: false
    end
  end
end
