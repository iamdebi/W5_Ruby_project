require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('controllers/continents_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/cities_controller')
require_relative('controllers/attractions_controller')
require_relative('controllers/review_controller')
require_relative('models/search.rb')


get '/' do
  erb( :home )
end

post '/search/:id' do
  @search = Search.search(params['search'])
  erb( :search )
end
