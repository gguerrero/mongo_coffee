require 'yaml'

module MongoCoffee
  class Config
    def self.load
      YAML.load_file(File.expand_path('../../../config/mongo_coffee.yml', __FILE__))
    end
  end
end