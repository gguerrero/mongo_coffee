# MongoCoffee

Map reduce your mongo documents writing in with coffeescript.
As simple as it sounds! Finally you can organize and write your huge map/reduce/finalize functions in coffeescript syntax!

## Setup and run!
The basic conventional config is already setup on the gem and is initialized within your rails app.
Run **mongo_coffee:config** generator to copy config files on your rails project, so you can edit them as your needs:

```bash
$ rails g mongo_coffee:config
      create  config/mongo_coffee.yml
      create  config/initializers/mongo_coffee.rb
```

On *mongo_coffee.yml* file you'll find some config you might change:

```yaml
coffee_path: 'app/models/map_reduces'
coffee_extensions:
  - .js.coffee
  - .coffee
```

## Usage
The **MongoCoffee** compiler engine will search on **coffee_path** path (see *setup* section above) for files 
matching the following convention: **%name%_%map/reduce/finalize%.js.coffee**, i.e in the example below the 
following files should be ready in *coffee_path* directory (could be in some subdirectory):

- playing_stats_map.js.coffee
- playing_stats_reduce.js.coffee
- playing_stats_finalize.js.coffee


### Caffeine to your model
Call any of your map/reduce coffeescript collection with:

```ruby
Band.caffeine_map_reduce('playing_stats').out(inline: 1)
```

If you've defined a finalize coffesript function you can also use it with:

```ruby
Band.caffeine_map_reduce('playing_stats').caffeine_finalize('playing_stats').out(inline: 1)
```


## ToDo
At the moment, only [mongoid](http://mongoid.org/) ODM gem is supported.
Hopefully [mongomapper](http://mongomapper.com/) is supported soon too.

## License
This project uses [*MIT-LICENSE*](http://en.wikipedia.org/wiki/MIT_License).
