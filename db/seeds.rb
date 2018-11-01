# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  Reservation.create(
      reserve_no: "zzzz0222200#{i}",
      guest_name: "backpacker#{i}",
      guest_phone: "0808888000#{i}",
      guest_mail: "example2#{i}@gmail.com",
      check_in_date: "2018-11-15",
      check_out_date: "2018-11-17",
      room_id: "#{20+i}",
      guest_count: "1",
      status: "apply")
end
