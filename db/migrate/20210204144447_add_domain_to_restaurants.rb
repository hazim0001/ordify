class AddDomainToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :domain, :string
    add_column :restaurants, :subdomain, :string
  end
end
