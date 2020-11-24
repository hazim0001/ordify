# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Order.destroy_all
LineItem.destroy_all
MenuItem.destroy_all
Table.destroy_all
Restaurant.destroy_all
Menu.destroy_all
Category.destroy_all

puts 'db is now clean......Seeding in progress'

rest_one = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, cusine: Faker::Restaurant.type)

puts "#{rest_one.name} has been created"
category_options = %w[sushi beef chicken pasta pizza burgers].sample
categoryy = []

5.times do
  categoryy << Category.create!(title: category_options)
  Table.create!(name: Faker::Artist.name, restaurant: rest_one)
end

puts 'Categories have been created'

menu_items_array = []

20.times do
  menu_item_new = MenuItem.create!(title: Faker::Food.dish, sub_total: rand(10.0..80.0).round(2), description: Faker::Food.description, category: categoryy.sample)
  Menu.create!(restaurant: rest_one, menu_item: menu_item_new)
  menu_items_array << menu_item_new
  puts "#{menu_item_new.title} has been created"
end

5.times do
  cust = Customer.create!(name: Faker::Name.name)
  puts "#{cust.name} has been created"
  order = Order.create!(table: Table.first, customer: cust)
  5.times do
    line = LineItem.create!(menu_item: menu_items_array.sample, comment: 'No onions please', quantity: rand(1..5), order: order)
    line.update!(total: LineItem.last.menu_item.sub_total * LineItem.last.quantity)
    puts "#{line} has been created an updated"
  end
  # byebug
  total = LineItem.where(order: order.id).sum(:total)
  order.update!(total_price: total)
end

# puts "tables are created #{tablee.sample}"
# 10.times do
#   menu_item_new = MenuItem.create!(title: Faker::Food.dish, item_price: rand(10.0..80.0).round(2), description: Faker::Food.description, category: categoryy.sample)
#   puts "menu ites has been created #{menu_item_new}"
#   user = User.create!(name: Faker::Name.name)
#   puts "User has been created #{user}"
#   # byebug
#   random_number = rand(1..5)
#   new_order = UserOrder.create!(user: user, table: tablee.sample)
#   order = OrderItem.create!(
#     menu_item: menu_item_new,
#     comment: Faker::Restaurant.type,
#     quantity: random_number,
#     price: menu_item_new.item_price * random_number,
#     user_order: new_order
#   )
#   new_order.total_price = order.price
#   new_order.save!
# end
puts "doneee"
