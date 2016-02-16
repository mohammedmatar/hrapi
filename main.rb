# encoding: UTF-8
require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra/cross_origin'

set :environment, :production
set :bind, '0.0.0.0'
configure :development do
  enable :cross_origin
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    'mysql://root@localhost/hr_new'
  )
end

configure :production do
  enable :cross_origin
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    'mysql://root@localhost/hr_new'
  )
end

require './models/init'
require './helpers/init'
require './routes/init'

DataMapper.finalize
