# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cusine.destroy_all
Restaurant.destroy_all
Category.destroy_all
Order.destroy_all
LineItem.destroy_all
MenuItem.destroy_all
Table.destroy_all


puts 'db is now clean......Seeding in progress'
cusine1 = Cusine.create!(name: "Fine Dining")

lardo = Restaurant.create!(name: "Lardo", address: Faker::Address.street_address, cusine: cusine1 )
Employee.create!(name:Faker::Name.name, role: "manager", restaurant: lardo, password: 123456, email: Faker::Internet.email )
Employee.create!(name:Faker::Name.name, role: "cook", restaurant: lardo,password: 123456, email: Faker::Internet.email )
Employee.create!(name: "hazim", role: "manager", restaurant: lardo,password: 123456, email: "hazim@hotmail.com", admin: true )

puts "#{lardo.name} has been created"

category_options = ["Small Plates","Soups & Salads", "Wine", "Chef's Selection", "Mains", "Pasta & SeaFood"  ]
categoryy = []
category_options.each { |cat| categoryy  << Category.create!(title: cat) }


Table.create!(name: "Table one", restaurant: lardo)

puts 'Categories have been created'

menu_items_array = []

20.times do
  menu_item_new = MenuItem.create!(title: Faker::Food.dish, item_price_cents: rand(1050..87590), description: Faker::Food.description, category: categoryy.sample, restaurant: lardo, portion_size_grams: rand(100..290))
  Inventory.create!(menu_item: menu_item_new, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))
  menu_items_array << menu_item_new
  puts "#{menu_item_new.title} has been created"
end

3.times do
  order = Order.create!(table: Table.first, user_number: 00201112550060)
  2.times do
    line = LineItem.create!(menu_item: menu_items_array.sample, comment: 'No onions please', quantity: rand(1..3), order: order)
    line.update!(total_cents: LineItem.last.menu_item.item_price_cents * LineItem.last.quantity)
    stock_item =Inventory.find(line.id)
    stock_item_amount = Inventory.find(line.id).stock_amount_grams
    stock_item.update(stock_amount_grams: stock_item_amount - (line.menu_item.portion_size_grams * line.quantity))
    puts "#{line} has been created an updated"
  end
  # byebug
  total = LineItem.where(order: order.id).sum(:total_cents)
  order.update!(total_price_cents: total)
end

puts "doneee"
