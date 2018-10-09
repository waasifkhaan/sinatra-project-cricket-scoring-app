require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride
use UsersController
use GamesController
use TeamsController
use PlayersController
run ApplicationController
#
#Now with this, it seems can we can invoke use multiple times,
# once for each middleware & run only once in a single Rack App. so use will only invoke a middleware,
# while run will run the rack object which will return final rack response with HTTP status code.
#
