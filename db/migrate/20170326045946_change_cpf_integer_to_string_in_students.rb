class ChangeCpfIntegerToStringInStudents < ActiveRecord::Migration
  def change
    change_column :students, :cpf, :string
  end
end
