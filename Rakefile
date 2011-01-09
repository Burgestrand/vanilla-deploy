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