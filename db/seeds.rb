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
cusine1 = Cusine.create!(name: Faker::Restaurant.type)

rest_one = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, cusine: cusine1 )
Employee.create!(name:Faker::Name.name, role: "manager", restaurant: rest_one, password: 123456, email: Faker::Internet.email )
Employee.create!(name:Faker::Name.name, role: "cook", restaurant: rest_one,password: 123456, email: Faker::Internet.email )

puts "#{rest_one.name} has been created"
category_options = %w[sushi beef chicken pasta pizza burgers].sample
categoryy = []

5.times do
  categoryy << Category.create!(title: category_options)
  Table.create!(name: "Table one", restaurant: rest_one)
end

puts 'Categories have been created'

menu_items_array = []

20.times do
  menu_item_new = MenuItem.create!(title: Faker::Food.dish, item_price: rand(10.0..80.0).round(2), description: Faker::Food.description, category: categoryy.sample, restaurant: rest_one)
  menu_items_array << menu_item_new
  puts "#{menu_item_new.title} has been created"
end

5.times do
  order = Order.create!(table: Table.first, user_number: 00201112550060)
  5.times do
    line = LineItem.create!(menu_item: menu_items_array.sample, comment: 'No onions please', quantity: rand(1..5), order: order)
    line.update!(total: LineItem.last.menu_item.item_price * LineItem.last.quantity)
    puts "#{line} has been created an updated"
  end
  # byebug
  total = LineItem.where(order: order.id).sum(:total)
  order.update!(total_price: total)
end

puts "doneee"
