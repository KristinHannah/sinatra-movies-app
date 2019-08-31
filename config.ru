require_relative './config/environment'

require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
#    raise "Migrations are pending. Run 'rake db:migrate' to continue."
#end 

use Rack::MethodOverride 
use SessionsController
use MoviesController
use UsersController
run ApplicationController