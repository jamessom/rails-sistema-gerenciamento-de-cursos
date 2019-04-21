class ChangeCpfIntegerToStringInStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :cpf, :string
  end
end
