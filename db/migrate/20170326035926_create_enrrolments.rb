class CreateEnrrolments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrrolments do |t|
      t.datetime :date_enrrolment
      t.references :student, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
