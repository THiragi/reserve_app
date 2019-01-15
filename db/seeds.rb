# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Reservation.create!(
    reserve_no: "zzzz1226521#{i}",
    guest_name: "Tourist#{i}",
    guest_phone: "0808889292#{i}",
    guest_mail: "tourist4#{i}@gmail.com",
    check_in_date: "2019-01-17",
    check_out_date: "2019-01-18",
    room_id: "#{1+i}",
    guest_count: "1",
    status: "apply")
end
