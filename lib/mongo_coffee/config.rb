require 'yaml'

module MongoCoffee
  class Config
    def self.load(filename)
      YAML.load_file(filename)
    end
  end
end