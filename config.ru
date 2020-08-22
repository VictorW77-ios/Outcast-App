require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


## the place where I'm going to mount my other controller 'use'
## in order to send PATCH and DELETE requests 

use Rack::MethodOverride
use UsersController
use PostsController

run ApplicationController