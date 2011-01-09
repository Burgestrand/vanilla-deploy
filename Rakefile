# coding: utf-8
require 'bundler/setup'

desc "Compiles and packages (with Jammit) CoffeeScript & SCSS"
task :assets => ['assets:compass', 'assets:coffee', 'assets:jammit']

namespace :assets do
  task :jammit do
    system "bundle exec jammit"
  end
  
  desc "Compiles SCSS using Compass"
  task :compass do
    system "bundle exec compass compile -c config/compass.rb"
  end
  
  desc "Compiles CoffeeScript using Barista"
  task :coffee do
    require 'barista'
    require './config/barista'
    
    Barista.compile_all! true, false
  end
end

# Vlad the Deployer
begin
  require 'vlad'
  require 'vlad/core'
  require 'vlad/git'
  require './config/deploy'
  
  namespace :vlad do
    desc "Updates the production server under a maintenance mode"
    task :deploy => ['maintenance:on', 'update', 'maintenance:off']
    
    # Bundles assets on the remote server
    remote_task :assets do
      run "cd #{current_release} && #{rake_cmd} assets"
    end
    
    # Put the server in maintenance mode
    # 
    # This assumes that you have a file named config/maintenance.html in your
    # project repository, and that you’ve `rake vlad:update` at least once. You
    # should configure your web server to serve only `tmp/maintenance.html` if
    # the file exists.
    # 
    # @see http://blog.nodeta.fi/2009/03/11/stopping-your-rails-application-with-phusion-passenger/
    namespace :maintenance do
      remote_task :on do
        run [
          "touch #{current_release}/public/maintenance.html",
          "cp -f #{current_release}/public/maintenance.html #{shared_path}/"
        ].join(' && ')
      end
      
      remote_task :off do
        run "rm -f #{shared_path}/maintenance.html"
      end
    end
  end
rescue LoadError => e
  warn "Some gems are missing, run `bundle install`"
  warn e.inspect
end