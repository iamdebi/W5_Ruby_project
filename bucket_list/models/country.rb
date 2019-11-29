require_relative('../db/sql_runner')
require_relative('city')

class Country

  attr_reader :id, :continent_id
  attr_accessor :name

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @continent_id = details['continent_id']
  end

  def save()
    sql = "INSERT INTO countries (name, continent_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@name, @continent_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE countries SET
    (name, continent_id) = ($1, $2) WHERE id = $3 "
    values = [@name, @continent_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM countries;"
    countries = SqlRunner.run(sql)
    return countries.map{|country| Country.new(country)}
  end

  def self.view(id)
    sql ="SELECT * FROM countries WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.first
  end

  def view_cities()
    sql = "SELECT * FROM cities where country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    return cities.map{|city| City.new(city)}
  end

end
