require 'mongo_coffee/version'
require 'mongo_coffee/engine'
require 'mongo_coffee/config'
require 'mongo_coffee/compiler'
require 'mongo_coffee/mongoid/finders'
require 'mongo_coffee/mongoid/map_reduce'


if defined? Mongoid
  module Mongoid::Finders
    include MongoCoffee::Mongoid::Finders
  end
  
  class Mongoid::Contextual::MapReduce
    include MongoCoffee::Mongoid::MapReduce
  end
end
