require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
require_relative './app/controllers/car_controller.rb'
require_relative './app/controllers/user_controller.rb'

use Rack::MethodOverride
use UserController
use CarController
run ApplicationController
