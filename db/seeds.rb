# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@gmail.com", password: 'administer')

RoomType.create(type_name: "Single", capacity: "1")

10.times do |i|
  Room.create(
      room_type_id: "1",
      room_name: "#{101+i}")
end

Rate.create(rate_type: "Standard18SNGL", amount: "5400", rank: "5", start_date: "2018-11-01", end_date: "2018-12-31", room_type_id: "1")
