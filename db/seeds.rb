# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create!([{name: 'Denim Shirt', description: 'Comfy shirt for walks in the woods and nights by the fire', image_url: 'denimcamerasmall.jpg', colour: 'Blue', price: '29.95', stock: '5'}, {name: 'Suede boots', description: 'These boots are made for walking...and for looking good', image_url: 'boots.jpg', colour: 'Brown', price: '49.95', stock: '1'}, {name: 'Checkered Shirt', description: 'For the manliest of men only', image_url: 'pipelakesmall.jpg', colour: 'Red', price: '25.95', stock: '7'}])