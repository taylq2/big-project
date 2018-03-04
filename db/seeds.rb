ActiveRecord::Base.transaction do

  puts "1. Seeding Area"
  areas = Array.new
  7.times do |i|
    areas << Area.new(name: Faker::LeagueOfLegends.champion)
  end
  Area.import! areas

  puts "2. Seeding users"
  users = Array.new
  users << Manager.new(name: "Manager", password: "123456", area_id: 1,
    room: 507, email: "manager@framgia.com")

  (1..7).each do |n|
    users << Seller.new(name: "Seller #{n}", password: "123456", area_id: n,
      room: 507, email: "seller#{n}@framgia.com")
  end

  (1..7).each do |n1|
    (1..50).each do |n|
      users << Buyer.new(name: "Buyer #{n}", password: "123456", area_id: n1,
        room: n, email: "buyer#{n}@framgia.com")
    end
  end
  User.import! users

  puts "3. Seeding categories"
  categories = Array.new
  5.times do |i|
    categories << Category.new(name: Faker::LeagueOfLegends.rank)
  end
  Category.import! categories

  puts "4. Seeding products"
  products = Array.new
  price = rand (10000..40000)
  started_at = 1.hours.ago
  finished_at = started_at + 4.hours
  Seller.all.each do |seller|
    Category.all.each do |category|
      3.times do |i|
        products << Product.new(name: Faker::LeagueOfLegends.champion,
          description: "Ngon", seller_id: seller.id,
          price: price, category_id: category.id, started_at: started_at,
          finished_at: finished_at)
      end
    end
  end
  Product.import! products
end
