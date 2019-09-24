require_relative './config/environment'

require './config/environment'

use Rack::MethodOverride 
use SessionsController
use MoviesController
use UsersController
run ApplicationController