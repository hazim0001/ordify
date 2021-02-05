# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# MenuItem.destroy_all
# Table.destroy_all
# Employee.destroy_all
# Restaurant.destroy_all
# Cusine.destroy_all
# Category.destroy_all
# Order.destroy_all
# LineItem.destroy_all

require "open-uri"

# puts 'db is now clean......Seeding in progress'
# # cusine1 = Cusine.create!(name: "Faker::Restaurant.type)"
# cusine1 = Cusine.create!(name: "test")

# # Restaurant.last = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, cusine: cusine1 )
# Restaurant.create!(name: "test", address: "test", cusine: cusine1 )

# Employee.create!(name:"hazim", role: "manager", restaurant: Restaurant.last,password: 123456, email: "hazim@hotmail.com", admin: true)
# Employee.create!(name:"Panchito", role: "manager", restaurant: Restaurant.last, password: 123456, email: "panchito@gmail.com", admin: true )
# Employee.create!(name:"Juanito", role: "cook", restaurant: Restaurant.last,password: 123456, email: "juanito@gmail.com" )
# Employee.create!(name:"test", role: "manager", restaurant: Restaurant.last, password: 123456, email: "test@hotmail.com", admin: true )

# puts "#{Restaurant.last.name} has been created"

# category_options = %w[test test]
# categoryy = []

# category_options.each do |item|
#   categoryy << Category.create!(title: item)
# end

# puts 'CATEGORIES have been created'

# Table.create!(name: "Table one", restaurant: Restaurant.last)
# # Table.create!(name: "Table two", restaurant: Restaurant.last)
# # Table.create!(name: "Table three", restaurant: Restaurant.last)
# # Table.create!(name: "Table four", restaurant: Restaurant.last)
# # Table.create!(name: "Table five", restaurant: Restaurant.last)

# puts 'TABLES have been created'

# menu_items_array = []

# 20.times do
#    menu_item_new = MenuItem.create!(title: Faker::Food.dish, item_price_cents: rand(1050..87590), description: "test test test", category: Category.last, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
#   Inventory.create!(menu_item: menu_item_new, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))
#   menu_items_array << menu_item_new
#   puts "#{menu_item_new.title} has been created"
# end

# 3.times do
#   order = Order.create!(table: Table.last, user_number: 00201112550060)
#   2.times do
#     line = LineItem.create!(menu_item: menu_items_array.sample, comment: 'testttt', quantity: rand(1..3), order: order)
#     line.update!(total_cents: LineItem.last.menu_item.item_price_cents * LineItem.last.quantity)
#     stock_item =Inventory.find(line.id)
#     stock_item_amount = Inventory.find(line.id).stock_amount_grams
#     stock_item.update(stock_amount_grams: stock_item_amount - (line.menu_item.portion_size_grams * line.quantity))
#     puts "#{line} has been created an updated"
#   end
#   # byebug
#   total = LineItem.where(order: order.id).sum(:total_cents)
#   order.update!(total_price_cents: total)
# end
# =======
# 20.times do
#   menu_item_new = MenuItem.create!(title: Faker::Food.dish, item_price_cents: rand(1050..87590), description: Faker::Food.description, category: categoryy.sample, restaurant: Restaurant.last)
#   menu_items_array << menu_item_new
#   puts "#{menu_item_new.title} has been created"
# end
# puts "running"
# menu_item = MenuItem.last
# file = URI.open('https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid')
# menu_item.photos.attach(io: file, filename: "#{menu_item.title}.png", content_type: 'image/png')
# menu_item.save!
# # Sashimi
# menu_item1 = MenuItem.new(title: "Shake", item_price_cents: rand(350..1090), description: "Fatty Salmon", category: Category.first, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item1 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file1 = URI.open('https://www.manusmenu.com/wp-content/uploads/2016/05/1-Salmon-Sashimi-with-Ponzu-3-1-of-1.jpg')
# menu_item1.photos.attach(io: file1, filename: "#{menu_item1.title}.jpg", content_type: 'image/jpg')
# menu_item1.save!

# menu_item2 = MenuItem.create!(title: "Maguro", item_price_cents: rand(350..1090), description: "Yellowfin tuna", category: Category.first, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item2 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file2 = URI.open('https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/amp_metadata_content_image_min_696px_wide/public/Original_18210_tuna-sashimi-sesame.jpg?itok=oOKFNPWZ')
# menu_item2.photos.attach(io: file2, filename: "#{menu_item2.title}.jpg", content_type: 'image/jpg')
# menu_item2.save!

# menu_item3 = MenuItem.create!(title: "Hirimasa", item_price_cents: rand(350..1090), description: "Yellowtail kingfish", category: Category.first, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item3 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file3 = URI.open('https://www.sashimiroyal.com/01/wp-content/uploads/2020/09/Sashimi_Jonathan-e1599811544550-600x600.jpg')
# menu_item3.photos.attach(io: file3, filename: "#{menu_item3.title}.jpg", content_type: 'image/jpg')
# menu_item3.save!

# menu_item4 = MenuItem.create!(title: "Sashimi mix", item_price_cents: rand(350..1090), description: "Salmon, yellowfin tuna and hiramasa", category: Category.first, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item4 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file4 = URI.open('https://www.victoria.bg/uploads/images/products/%20%D0%A1%D1%8C%D0%BE%D0%BC%D0%B3%D0%B0%20%D0%B8%20%D0%A2%D0%BE%D0%BD%20%D1%81%D0%B0%D0%B9%D1%82_1710.jpg')
# menu_item4.photos.attach(io: file4, filename: "#{menu_item4.title}.jpg", content_type: 'image/jpg')
# menu_item4.save!

# #NIGIRI
# menu_item5 = MenuItem.create!(title: "Inari", item_price_cents: rand(350..890), description: "tofu with ginger and trout roe", category: Category.second, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item5 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file5 = URI.open('https://hapoweb.com/image/cache/catalog/productos/niguiris/Nigiri_inari-666x666.jpg')
# menu_item5.photos.attach(io: file5, filename: "#{menu_item5.title}.jpg", content_type: 'image/jpg')
# menu_item5.save!

# menu_item6 = MenuItem.create!(title: "Abokado", item_price_cents: rand(350..890), description: "avocado, miso aïoli & sesame", category: Category.second, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item6 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file6 = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/15/f4/33/88/nigiri-abokado.jpg')
# menu_item6.photos.attach(io: file6, filename: "#{menu_item6.title}.jpg", content_type: 'image/jpg')
# menu_item6.save!

# menu_item7 = MenuItem.create!(title: "Hirame", item_price_cents: rand(350..890), description: "lightly smoked halibut", category: Category.second, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item7 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file7 = URI.open('https://pbs.twimg.com/media/D1FnsprXQBAXH8D.jpg')
# menu_item7.photos.attach(io: file7, filename: "#{menu_item7.title}.jpg", content_type: 'image/jpg')
# menu_item7.save!

# menu_item8 = MenuItem.create!(title: "Kinoko", item_price_cents: rand(350..890), description: "portobello mushroom & lime salt", category: Category.second, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item8 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file8 = URI.open('https://wasabisushibars.com/wp-content/uploads/2018/03/Ikura.jpg')
# menu_item8.photos.attach(io: file8, filename: "#{menu_item8.title}.jpg", content_type: 'image/jpg')
# menu_item8.save!

# menu_item9 = MenuItem.create!(title: "Hiramasa Yaki", item_price_cents: rand(350..890), description: "eared yellowtail kingfish", category: Category.second, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item: menu_item9 , stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file9 = URI.open('https://gurunavi.com/en/japanfoodie/article/28_popular_sushi_toppings/img/12_nigiri.jpg')
# menu_item9.photos.attach(io: file9, filename: "#{menu_item9.title}.jpg", content_type: 'image/jpg')
# menu_item9.save!

# #Maki
# menu_item10 = MenuItem.create!(title: "Ebi Panko", item_price_cents: rand(1050..1790), description: "tempura shrimp & spicy sauce, topped with avocado", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item10, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file10 = URI.open('https://herlev.katsurasushi.dk/wp-content/uploads/2018/09/7-5.jpg')
# menu_item10.photos.attach(io: file10, filename: "#{menu_item10.title}.jpg", content_type: 'image/jpg')
# menu_item10.save!

# menu_item11 = MenuItem.create!(title: "New York Subway", item_price_cents: rand(1050..1790), description: "tempura shrimp, avocado & spicy sauce,topped with salmon & garlic", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item11, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file11 = URI.open('https://speisekarte.menu/storage/media/dishes_main/1298066/dragon-roll-new-600x400-1531910444.jpg')
# menu_item11.photos.attach(io: file11, filename: "#{menu_item11.title}.jpg", content_type: 'image/jpg')
# menu_item11.save!

# menu_item12 = MenuItem.create!(title: "Shake Aïoli", item_price_cents: rand(1050..1790), description: "snow peas,avocado, miso aïoli & cucumber, topped with seared salmon & trout roe", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item12, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file12 = URI.open('https://cdn.phonebooky.com/blog/wp-content/uploads/2018/02/21154630/MISO-SALMON-ROLL.png')
# menu_item12.photos.attach(io: file12, filename: "#{menu_item12.title}.png", content_type: 'image/png')
# menu_item12.save!

# menu_item13 = MenuItem.create!(title: "Hell’s Kitchen", item_price_cents: rand(1050..1790), description: "tempura shrimp, avocado & spicy sauce, topped with tuna & barbecue", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item13, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file13 = URI.open('https://sumosumosushi.com/wp-content/uploads/2014/06/Spicy-Tuna-Tempura-Maki.jpg')
# menu_item13.photos.attach(io: file13, filename: "#{menu_item13.title}.jpg", content_type: 'image/jpg')
# menu_item13.save!

# menu_item14 = MenuItem.create!(title: "Ceviche", item_price_cents: rand(1050..1790), description: "pickled red onion,avocado & cucumber, topped with scallops & coriander cress", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item14, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file14 = URI.open('https://www.rickbayless.com/wp-content/uploads/2017/02/maki-layer.jpg')
# menu_item14.photos.attach(io: file14, filename: "#{menu_item14.title}.jpg", content_type: 'image/jpg')
# menu_item14.save!

# menu_item15 = MenuItem.create!(title: "Rainbow", item_price_cents: rand(1050..1790), description: "shrimp & snow peas, topped with salmon, tuna, hiramasa & avocado", category: Category.third, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item15, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file15 = URI.open('https://www.rainbowbrookline.com/wp-content/uploads/2019/12/Rainbow-Maki.jpg')
# menu_item15.photos.attach(io: file15, filename: "#{menu_item15.title}.jpg", content_type: 'image/jpg')
# menu_item15.save!

# #sticks
# menu_item16 = MenuItem.create!(title: "Ramuyaki", item_price_cents: rand(350..1090), description: "Lamb chop & miso herb butter", category: Category.fourth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item16, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file16 = URI.open('https://rimage.gnst.jp/rest/img/82ye6hxp0000/s_0n7w.jpg?t=1574986167')
# menu_item16.photos.attach(io: file16, filename: "#{menu_item16.title}.jpg", content_type: 'image/jpg')
# menu_item16.save!

# menu_item17 = MenuItem.create!(title: "Buta Yaki", item_price_cents: rand(350..1090), description: "Organic free-range pork with yuzu-miso", category: Category.fourth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item17, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file17 = URI.open('https://i.pinimg.com/originals/3c/c2/1b/3cc21b52cd8322ca80be3d323a6708ac.jpg')
# menu_item17.photos.attach(io: file17, filename: "#{menu_item17.title}.jpg", content_type: 'image/jpg')
# menu_item17.save!


# menu_item18 = MenuItem.create!(title: "Eringi", item_price_cents: rand(350..1090), description: "King oyster mushroom & miso", category: Category.fourth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item18, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file18 = URI.open('https://rimage.gnst.jp/rest/img/82ye6hxp0000/s_0n7w.jpg?t=1574986167')

# menu_item18 = MenuItem.create!(title: "Eringi", item_price_cents: rand(350..1090), description: "King oyster mushroom & miso", category: Category.fourth, restaurant: Restaurant.last)
# file18 = URI.open('https://cdn.shopify.com/s/files/1/0108/5757/8558/files/DSC08334-2_1024x1024.jpg?v=1573921749')

# menu_item18.photos.attach(io: file18, filename: "#{menu_item18.title}.jpg", content_type: 'image/jpg')
# menu_item18.save!

# menu_item18 = MenuItem.create!(title: "Eringi", item_price_cents: rand(350..1090), description: "King oyster mushroom & miso", category: Category.fourth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item18, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file18 = URI.open('https://rimage.gnst.jp/rest/img/82ye6hxp0000/s_0n7w.jpg?t=1574986167')
# menu_item18.photos.attach(io: file18, filename: "#{menu_item18.title}.jpg", content_type: 'image/jpg')
# menu_item18.save!

# menu_item19 = MenuItem.create!(title: "Hotate Bacon", item_price_cents: rand(350..1090), description: "Scallops & bacon with miso herb butter", category: Category.fourth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item19, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file19 = URI.open('https://images.eatsmarter.com/sites/default/files/styles/1600x1200/public/bacon-wrapped-scallops-483939.jpg')
# menu_item19.photos.attach(io: file19, filename: "#{menu_item19.title}.jpg", content_type: 'image/jpg')
# menu_item19.save!

# # #Salads
# menu_item20 = MenuItem.create!(title: "Jungle Fish Salad", item_price_cents: rand(1050..1490), description: "Grilled salmon, shrimp and seared tuna, on a bed of green leaf salad, red cabbage, quinoa, tomatoe and avocado", category: Category.fifth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item20, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file20 = URI.open('https://static01.nyt.com/images/2016/08/03/dining/03KITCH1-WEB/03KITCH1-WEB-articleLarge-v2.jpg')
# menu_item20.photos.attach(io: file20, filename: "#{menu_item20.title}.jpg", content_type: 'image/jpg')
# menu_item20.save!

# menu_item21 = MenuItem.create!(title: "Green Gate Salad", item_price_cents: rand(1050..1490), description: "Grilled sweet potato, cauliflower &  mushroom on a bed of green leaf salad, cabbage, quinoa, tomatoes, avocado", category: Category.fifth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item21, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file21 = URI.open('https://cnz.to/wp-content/uploads/2015/06/grille_sweet_potatoes-3.jpg')
# menu_item21.photos.attach(io: file21, filename: "#{menu_item21.title}.jpg", content_type: 'image/jpg')
# menu_item21.save!

# menu_item22 = MenuItem.create!(title: "Green Bird Salad", item_price_cents: rand(1050..1490), description: "Marinated chicken and soy egg on a salad of green leaves, red cabbage, quinoa, tomatoes, edamame, radish, broccoli & sesame.", category: Category.fifth, restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item22, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file22 = URI.open('https://www.marionskitchen.com/wp-content/uploads/2019/10/20190926_PRODUCT-Miso-Chicken-Salad-Bowl.jpg')
# menu_item22.photos.attach(io: file22, filename: "#{menu_item22.title}.jpg", content_type: 'image/jpg')
# menu_item22.save!

# #Sake
# menu_item23 = MenuItem.create!(title: "Mio Sparkling,Takara [5%]", item_price_cents: rand(500..1090), description: "Fruity with a refreshing, sweet aroma and fine bubbles. Perfect as an aperitif.", category: Category.find_by(title: "Sake"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item23, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file23 = URI.open('https://cdn.shopify.com/s/files/1/0051/3759/6505/products/Takara_-Sho-Chiku-Bai-Shirakabegura-Mio_1800x1800.jpg?v=1540090941')
# menu_item23.photos.attach(io: file23, filename: "#{menu_item23.title}.jpg", content_type: 'image/jpg')
# menu_item23.save!

# menu_item24 = MenuItem.create!(title: "Gok Arakuchi sake [15%]", item_price_cents: rand(500..1090), description: "Award winning warm sake. Wonderfully well balanced,classic and dry.", category: Category.find_by(title: "Sake"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item24, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file24 = URI.open('https://images.squarespace-cdn.com/content/v1/54cf79b3e4b0728e9032df0e/1431925084982-Q3E45FGN67B4V7JO6ZLU/ke17ZwdGBToddI8pDm48kAMtqAZIyrPJ6RxqTyXaP4lZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpyKm6B0FEU1-CBmo6xwueQGYIkG2veJ81ILz3I2oNVIXgAXLhAcb6vmENLVltCu8X8/Kikusui_Karakuchi_H_720.jpg')
# menu_item24.photos.attach(io: file24, filename: "#{menu_item24.title}.jpg", content_type: 'image/jpg')
# menu_item24.save!

# menu_item25 = MenuItem.create!(title: "Tokebetsu Sake [15.5%]", item_price_cents: rand(500..1090), description: "Award winning warm sake. Wonderfully well balanced,classic and dry.", category: Category.find_by(title: "Sake"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item25, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file25 = URI.open('https://comerjapones.com/sake/med/img/sakes/kuroobi-yu-yu-tokubetsu-junmai/fukumitsuya-kuroobi-yuyu.jpg')
# menu_item25.photos.attach(io: file25, filename: "#{menu_item25.title}.jpg", content_type: 'image/jpg')
# menu_item25.save!

# #BEERS
# menu_item26 = MenuItem.create!(title: "Asahi [5.2%]", item_price_cents: rand(350..690), description: "Brewed to the authentic Japanese recipe to deliver its dry, crisp taste and quick clean finish.", category: Category.find_by(title: "Beers"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item26, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file26 = URI.open('https://cdn.shopify.com/s/files/1/2050/5437/products/asahi-super-dry-beer_grande.jpg?v=1571611036')
# menu_item26.photos.attach(io: file26, filename: "#{menu_item26.title}.jpg", content_type: 'image/jpg')
# menu_item26.save!

# menu_item27 = MenuItem.create!(title: "Saporo [5%]", item_price_cents: rand(350..690), description: "Japan’s most beautifully labelled beer. Smooth taste with a hint of sweetness. An excellent, easy-to-drink, modern lager", category: Category.find_by(title: "Beers"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item27, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file27 = URI.open('https://manila-wine.com/media/catalog/product/s/a/sapporo-premium-beer.jpg')
# menu_item27.photos.attach(io: file27, filename: "#{menu_item27.title}.jpg", content_type: 'image/jpg')
# menu_item27.save!

# menu_item28 = MenuItem.create!(title: "Kirin Ichiban [5%]", item_price_cents: rand(350..690), description: "chiban Shibori is a unique method of brewing beer at its purest from a single, pure ingredient: 100% malt.", category: Category.find_by(title: "Beers"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item28, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file28 = URI.open('https://lafrikileria.com/33809-thickbox_default/cerveza-japonesa-kirin-ichiban-33-cl.jpg')
# menu_item28.photos.attach(io: file28, filename: "#{menu_item28.title}.jpg", content_type: 'image/jpg')
# menu_item28.save!

# menu_item29 = MenuItem.create!(title: "Brooklyn Special [0.4%]", item_price_cents: rand(350..690), description: "Hoppy and aromatic lager style beer, full of flavour but low in alcohol content.", category: Category.find_by(title: "Beers"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item29, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file29 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT68w6is4pzYk4zKf2fX5lpw8vSdevg9szT-A&usqp=CAU')
# menu_item29.photos.attach(io: file29, filename: "#{menu_item29.title}.jpg", content_type: 'image/jpg')
# menu_item29.save!

# #Tea
# menu_item30 = MenuItem.create!(title: "Matcha Tea", item_price_cents: rand(300..550), description: "The finest leaves from the harvest of the year, ground on ancient stone grinding wheels and whipped into a smooth, frothy tea.", category: Category.find_by(title: "Tea"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item30, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file30 = URI.open('https://cdn.shopify.com/s/files/1/0061/8640/1876/articles/can-matcha-tea-reduce-anxiety-661458_1024x1024.jpg?v=1573003036')
# menu_item30.photos.attach(io: file30, filename: "#{menu_item30.title}.jpg", content_type: 'image/jpg')
# menu_item30.save!

# menu_item31 = MenuItem.create!(title: "Sencha & Matcha", item_price_cents: rand(300..550), description: "Green tea with a fine scent of fresh grass. Perfect for sushi.This Sencha is mixed with Matcha for a deep colour and fantastic taste.", category: Category.find_by(title: "Tea"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item31, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file31 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtTxW1GpGOnoNuvKKyQ8KV7d24fNyCj0kJ5Q&usqp=CAU')
# menu_item31.photos.attach(io: file31, filename: "#{menu_item31.title}.jpg", content_type: 'image/jpg')
# menu_item31.save!

# menu_item32 =  MenuItem.create!(title: "Genmaicha Tea", item_price_cents: rand(300..550), description: "Green tea with popped rice. Mild and soft with a fine taste of nuts.", category: Category.find_by(title: "Tea"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item32, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file32 = URI.open('https://teaminded.com/wp-content/uploads/2019/08/how-to-make-mushroom-tea-01-1024x683.jpg')
# menu_item32.photos.attach(io: file32, filename: "#{menu_item32.title}.jpg", content_type: 'image/jpg')
# menu_item32.save!

# menu_item33 = MenuItem.create!(title: "Jasmine Tea", item_price_cents: rand(300..550), description: "Green tea with an elegant taste of jasmine.", category: Category.find_by(title: "Tea"), restaurant: Restaurant.last, portion_size_grams: rand(100..290))
# Inventory.create!(menu_item:  menu_item33, stock_amount_grams: rand(5000..19000), trigger_limit: rand(2500..6000))

# file33 = URI.open('https://dsimg.wowjpn.goo.ne.jp/rs/?src=https://wow-j.com/images/ext/allguides/01183/01183_001.jpg&maxw=750&maxh=0&resize=1')
# menu_item33.photos.attach(io: file33, filename: "#{menu_item33.title}.jpg", content_type: 'image/jpg')
# menu_item33.save!

`say "i am working very hard to finish what you asked. apologies"`

puts "MENU ITEMs have been created"
sleep(2)

# 3.times do
#   order = Order.create!(table: Table.first, user_number: 00201112550060)
#   2.times do
#     line = LineItem.create!(menu_item: menu_items_array.sample, comment: 'No onions please', quantity: rand(1..3), order: order)
#     line.update!(total_cents: LineItem.last.menu_item.item_price_cents * LineItem.last.quantity)
#     puts "#{line} has been created an updated"
#   end
#   # byebug
#   total = LineItem.where(order: order.id).sum(:total_cents)
#   order.update!(total_price_cents: total)
# end

#images

# file1 = URI.open('https://www.manusmenu.com/wp-content/uploads/2016/05/1-Salmon-Sashimi-with-Ponzu-3-1-of-1.jpg')
# MenuItem.where(category_id: 1).photos.attach(io: file1, filename: 'menuitem1.jpg', content_type: 'image/jpg')
# ingredient_inventory_items = %w[salt pepper beef salmon chicken rice cheese]

# ingredient_inventory_items.each do |ingredient|
#   ing = IngredientInventory.create(name: ingredient, vendor_name: "MR.#{ingredient}", vendor_phone_number: "01XXXXXXXXX", stock_amount_grams: rand(2500..6000), trigger_limit: rand(500..2500))
#   if ing.name == "salt" || "pepper"
#     Category.find_by(title: "Salads").menu_items.each do |menu_item|
#       Ingredient.create(menu_item: menu_item, ingredient_inventory: ing, ingredient_portion_size_grams: 10, title:"#{ing.name} for #{menu_item.title}")
#     end
#   else
#     Category.find_by(title: "Salads").menu_items.each do |menu_item|
#       Ingredient.create(menu_item: menu_item, ingredient_inventory: ing, ingredient_portion_size_grams: 200, title:"#{ing.name} for #{menu_item.title}")
#     end
#   end
# end

puts "doneee !!"

`say "i am done master"`
