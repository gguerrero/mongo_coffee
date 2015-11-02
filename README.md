# MongoCoffee

Map reduce your mongo documents writing in with coffeescript.
As simple as it sounds! Finally you can organize and write your huge map/reduce/finalize functions in coffeescript syntax!

## Setup and run!
Run **mongo_coffee:config** generator to setup config files on your rails project.
Then you can edit them as your needs:

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

Where this may be the content of the files:

**playing_stats_map.js.coffee**

```coffeescript
->
  emit
    artirst: @artist
    album: @album,
      plays: 1
      votes: 1
```

**playing_stats_reduce.js.coffee**


```coffeescript
(key, values) ->
  result =
    plays: 0
    votes: 0
  

  for value in values
    result.plays += value.plays
    result.votes += value.votes
```

Have a look at [**the mongodb map/reduce documentation**](https://docs.mongodb.org/manual/core/map-reduce/).

### Caffeine to your model
Call any of your map/reduce coffeescript collection with:

```ruby
Band.caffeine_map_reduce('playing_stats').out(inline: 1)
```

If you've defined a finalize coffesript function you can also use it with:

```ruby
Band.caffeine_map_reduce('playing_stats').caffeine_finalize('playing_stats').out(inline: 1)
```

As you may think, a map/reduce action will generate a new collection on MongoDB so, you may create it's model for interaction with new documents:

```ruby
class PlayingStat
  include Mongoid::Document
  store_in collection: 'playing_stats'

  field :value

  index({"_id.artist" => 1},{background: true})
  index({"_id.artist" => 1, "_id.album" => 1},{background: true})

  def artist
    _id["artist"]
  end

  def album
    _id["album"]
  end

  def total_plays
    value["plays"]
  end

  def total_votes
    value["votes"]
  end
end
```

## License
This project uses [*MIT-LICENSE*](http://en.wikipedia.org/wiki/MIT_License).
