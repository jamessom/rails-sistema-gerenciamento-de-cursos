class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :trainer, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.datetime :initial_date
      t.datetime :end_date
      t.integer :workload

      t.timestamps null: false
    end
  end
end
