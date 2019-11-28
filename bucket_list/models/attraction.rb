require_relative('../db/sql_runner')

# CREATE TABLE attractions(
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(255),
#   review TEXT,
#   review_rating INT,
#   city_id INT REFERENCES cities(id) ON DELETE CASCADE
# );

class Attractions

  attr_reader :id, :city_id
  attr_accessor :name, :review, :review_rating

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @review = details['review']
    @review_rating = details['review_rating']
    @city_id = details['city_id']
  end

end
