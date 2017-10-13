require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

require("pry")

Customer.delete_all()
Film.delete_all()

customer_1 = Customer.new({
  "name" => "Lou Carpenter",
  "funds" => 11})
customer_1.save()

customer_2 = Customer.new({
  "name" => "Helen Daniels",
  "funds" => 100})
customer_2.save()

film_1 = Film.new({
  "title" => "Fountain",
  "price" => 10
  })
film_1.save()

film_2 = Film.new({
  "title" => "McCalkin",
  "price" => 10
  })
film_2.save()

ticket_1 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_1.id
  })


ticket_2 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_2.id
  })


ticket_3 = Ticket.new({
  "customer_id" => customer_2.id,
  "film_id" => film_2.id
  })

  binding.pry
  nil

#
# Visit.delete_all()
# Location.delete_all()
# User.delete_all()

# location1 = Location.new({ 'category' => 'Attractions', 'name' => 'Mordor'})
# location1.save()
# location2 = Location.new({ 'category' => 'Places To Go', 'name' => 'Hobbiton'})
# location2.save()
#
# visit1 = Visit.new({ 'user_id' => user1.id, 'location_id' => location1.id, 'review' => '0 stars, far too hot'})
# visit1.save()
# visit2 = Visit.new({ 'user_id' => user2.id, 'location_id' => location1.id, 'review' => '5 stars, would visit again if I could'})
# visit2.save()
# visit3 = Visit.new({ 'user_id' => user1.id, 'location_id' => location2.id, 'review' => '4 stars, plenty of beer available'})
# visit3.save()
#
# binding.pry
# nil

# Your app should be able to:
#
#     Create customers, films and tickets
#     CRUD actions (create, read, update, delete) customers, films and tickets.
#     Show which films a customer has booked to see, and see which customers are coming to see one film.
