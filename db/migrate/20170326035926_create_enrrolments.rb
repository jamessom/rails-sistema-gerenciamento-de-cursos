class CreateEnrrolments < ActiveRecord::Migration
  def change
    create_table :enrrolments do |t|
      t.datetime :date_enrrolment
      t.references :Student, index: true, foreign_key: true
      t.references :Team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
