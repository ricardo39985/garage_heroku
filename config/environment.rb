ENV['SINATRA_ENV'] ||= "development"
require 'pg'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
set :database_file, './database.yml'

require './app/controllers/application_controller'
require 'pry'
require 'faker'
I18n.reload!
include Faker
require_all 'app'

