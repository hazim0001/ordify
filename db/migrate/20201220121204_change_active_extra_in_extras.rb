class ChangeActiveExtraInExtras < ActiveRecord::Migration[6.0]
  def change
    remove_column :extras, :active_extra, :boolean
    add_column :extras, :active_extra, :boolean, default: true
  end
end
