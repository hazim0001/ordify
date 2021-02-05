class AddAcceptsExtraToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :accepts_extra, :boolean, default: true
  end
end
