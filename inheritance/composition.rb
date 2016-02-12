class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select(&:needs_spare)
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

module PartsFactory
  def self.build(config, part_class = Part, parts_class = Parts)
    parts_class.new(
      config.map do |part_config|
        part_class.new(
          name: part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true))
      end
    )
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color] # RoadBike can optionally override it
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size # subclass default
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size # subclass default
    '2.1'
  end
end

chain = Part.new(name: "chain", description: "10-speed")

road_tire = Part.new(name: "tire_size", description: "23")

tape = Part.new(name: "tape_color", description: "red")

mountain_tire = Part.new(name: "tire_size", description: "2.1")

rear_shock = Part.new(name: "rear_shock", description: "Fox")

front_shock = Part.new(name: "front_shock", description: "Manitou", needs_spare: false)

road_bike_parts = Parts.new([chain, road_tire, tape])

mountain_bike_parts = Parts.new([chain, mountain_tire, front_shock, rear_shock])

road_bike = 
  Bicycle.new(
    size: "L",
    parts: road_bike_parts)

puts road_bike.size
puts road_bike.spares

mountain_bike =
  Bicycle.new(
    size: "L",
    parts: mountain_bike_parts)

puts mountain_bike.size
puts mountain_bike.spares
puts mountain_bike.spares.size
puts mountain_bike.parts.size
