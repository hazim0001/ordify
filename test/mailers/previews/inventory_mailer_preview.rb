# Preview all emails at http://localhost:3000/rails/mailers/inventory_mailer
class InventoryMailerPreview < ActionMailer::Preview
  def submission(message)
    restaurant_manager = inventory.restaurant.employees.find_by(role: "manager").email
    # This is how you pass value to params[:user] inside mailer definition!
    tes = "test etst"
    InventoryMailer.submission(tes)
  end
end
