require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")
require_relative("../models/screening.rb")

require("pry")

Ticket.delete_all()
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

customer_3 = Customer.new({
  "name" => "Madge Bishop",
  "funds" => 11})


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

screening_1 = Screening.new({
  "film_id" => film_1.id,
  "show_time" => "20:00:00"
  })

screening_2 = Screening.new({
  "film_id" => film_1.id,
  "show_time" => "22:00:00"
  })

screening_3 = Screening.new({
  "film_id" => film_2.id,
  "show_time" => "15:00:00"
  })

ticket_1 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_1.id
  })
ticket_1.save()

ticket_2 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_2.id
  })
ticket_2.save()

ticket_3 = Ticket.new({
  "customer_id" => customer_2.id,
  "film_id" => film_2.id
  })
ticket_3.save()

  binding.pry
  nil
