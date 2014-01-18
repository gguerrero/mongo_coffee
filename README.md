# MongoCoffee

Map reduce your mongo documents writing in with coffeescript.
That is! Finally you can organize and write your huge map/reduce/finalize functions in coffeescript syntax!

## Setup and run!

Bla bla bla...

## Usage

### Paths
You can change the paths where coffeescripts files are readed by changing *config/mongo_coffee.yml* file.
...

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
