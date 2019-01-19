# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.destroy_all

20.times do |i|
  r = rand(1..Room.count)
  c = Room.find(r).room_type.capacity
  term = Date.new(2019, 1, 1)..Date.new(2019, 1, 31)
  apply = term.to_a.sample
  checkin = apply.tomorrow
  checkout = checkin.tomorrow
  Reservation.create!(
    reserve_no: (('a'..'z').to_a).sample(4).join + sprintf('%08d', Reservation.count + 1),
    guest_name: "Tourist#{i}",
    guest_phone: 8908889292 + i,
    guest_mail: "tourist@gmail.com",
    check_in_date: checkin,
    check_out_date: checkout,
    room_id: r,
    guest_count: rand(1..c),
    status: "apply",
    apply_date: apply)
end
