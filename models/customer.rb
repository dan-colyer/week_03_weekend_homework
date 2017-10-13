require_relative("../db/sql_runner.rb")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @funds = options["funds"]
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    customer = customers.map {|customer| Customer.new(customer)}
    return customer
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* from films
          INNER JOIN tickets ON films.id = tickets.film_id
          WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    film = films.map {|film| Film.new(film)}
    return film
  end
end
#
# def locations()
#   sql = "SELECT locations.* FROM locations
#         INNER JOIN visits
#         ON locations.id = visits.location_id
#         WHERE user_id = $1"
#   values = [@id]
#   results = SqlRunner.run(sql, values)
#   locations = results.map {|location| Location.new(location)}
#   return locations
# end
