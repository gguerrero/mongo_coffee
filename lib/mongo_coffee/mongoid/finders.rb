module MongoCoffee::Mongoid
  module Finders

    def caffeine_map_reduce(filename)
      compiled_map    = MongoCoffee::Compiler.compile(filename, :map) 
      compiled_reduce = MongoCoffee::Compiler.compile(filename, :reduce) 

      map_reduce(compiled_map, compiled_reduce)
    end

  end
end