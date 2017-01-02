require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])
require 'date'
require_relative '../app/models/chat_line'
Dir[File.expand_path('../initializers/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../app/**/*.rb', __FILE__)].each { |file| require file }
