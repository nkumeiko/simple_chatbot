dbconfig = YAML.load(File.read(File.expand_path('../../../db/config.yml', __FILE__)))
ActiveRecord::Base.establish_connection(dbconfig[ENV['RACK_ENV']])
