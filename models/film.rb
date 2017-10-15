require_relative("../db/sql_runner.rb")

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @price = options["price"]
  end

  def save()
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2)
          RETURNING id"
    values = [@title, @price]
    customer = SqlRunner.run(sql, values).first
    @id = customer["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    film = films.map {|film| Film.new(film)}
    return film
  end

  def customers()
    sql = "SELECT customers.* from customers
          INNER JOIN tickets ON customers.id = tickets.customer_id
          WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    customer = customers.map {|customer| Customer.new(customer)}
    return customer
  end

  def customer_count()
    sql = "SELECT customers.* from customers
          INNER JOIN tickets ON customers.id = tickets.customer_id
          WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    customer = customers.map {|customer| Customer.new(customer)}
    return customer.length
  end

end
