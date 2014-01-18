module MongoCoffee::Mongoid
  module MapReduce

    def caffeine_finalize(filename)
      compiled_finalize = MongoCoffee::Compiler.compile(filename, :finalize)
 
      finalize compiled_finalize
    end

  end
end