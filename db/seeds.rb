# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# PRODUCT
Cart.destroy_all
Product.destroy_all
Order.destroy_all
OrderItem.destroy_all

product1 = Product.create({:name=>"tomato", :description=>'supermarket item',:price => 100, :stock => 50})
product2 = Product.create({:name=>"milk", :description=>'supermarket item',:price => 300, :stock => 50})
product3 = Product.create({:name=>"bread", :description=>'supermarket item',:price => 550, :stock => 50})
product4 = Product.create({:name=>"bacon", :description=>'supermarket item',:price => 100, :stock => 50})
product5 = Product.create({:name=>"cheese", :description=>'supermarket item',:price => 320, :stock => 50})

puts "Total number of products: #{Product.all.count}"
puts "\nTotal cart count: #{Cart.all.count}"