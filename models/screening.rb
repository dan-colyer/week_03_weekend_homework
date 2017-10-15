require_relative("../db/sql_runner.rb")

class Screening
  attr_reader :id
  attr_accessor :film_id, :show_time

  def initialize(options)
    @id = options["id"].to_i
    @film_id = options["film_id"].to_i
    @show_time = options["show_time"]
  end


end
