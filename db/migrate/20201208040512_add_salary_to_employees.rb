class AddSalaryToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :salary, :integer
  end
end
