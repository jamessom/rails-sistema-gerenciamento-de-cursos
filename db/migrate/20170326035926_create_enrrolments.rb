class CreateEnrrolments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrrolments do |t|
      t.datetime :date_enrrolment
      t.references :students, index: true, foreign_key: true
      t.references :teams, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
