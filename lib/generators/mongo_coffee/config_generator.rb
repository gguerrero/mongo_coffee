class MongoCoffee::ConfigGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
 
  desc "Generate the mongo coffee config and initializer files in your project."
  def copy_config_file
    copy_file "mongo_coffee.yml", "config/mongo_coffee.yml"
    copy_file "mongo_coffee.rb",  "config/initializers/mongo_coffee.rb"
  end
end
