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

  Area.all.each do |area|
    users << Seller.new(name: "Seller #{area.id}", password: "123456", area_id: area.id,
      room: 507, email: "seller#{area.id}@framgia.com")
  end

  Area.all.each do |area|
    users << Buyer.new(name: "Buyer #{area.id}", password: "123456", area_id: area.id,
      room: 507, email: "buyer#{area.id}@framgia.com")
  end
  users.each do |user|
    user.confirm
  end

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

  Area.all.each do |area|
    Product.all.each do |product|
      AreasProduct.create(area_id: area.id, product_id: product.id)
    end
  end
end
