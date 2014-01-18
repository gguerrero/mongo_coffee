require 'coffee-script'

module MongoCoffee

  class CoffeeFileNotFound < StandardError
    def initialize(filename)
      message = "File '#{filename}' does not exists."
      super message
    end
  end

  class Compiler

    class << self
      def setup!
        @config = Config.load
      end

      def compile(name, action)
        @name   = name
        @action = action

        extract
      end

      private
      def filename
        path = @config["coffee_path"]
        extensions = @config["coffee_extensions"].join(',')

        wildcard = Rails.root.join(path, "**/#{@name}_#{@action}{#{extensions}}")

        files = Dir.glob(wildcard)
        raise CoffeeFileNotFound, wildcard if files.empty?

        files.first
      end

      def extract
        CoffeeScript.compile(File.open(filename), bare: true).chomp.slice(1..-3)
      end
    end
  end

end
