class AddAdminToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :admin, :boolean, default: false
  end
end
