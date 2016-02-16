require './main'
set :environment, :production
set :bind, '0.0.0.0'
set :port, 4567

run Sinatra::Application