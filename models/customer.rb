require_relative("../db/sql_runner.rb")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @funds = options["funds"]
  end
end

# require_relative("../db/sql_runner")
# require_relative("location.rb")
#
# class User
#
#   attr_reader :id
#   attr_accessor :name
#
#   def initialize( options )
#     @id = options['id'].to_i
#     @name = options['name']
#   end
