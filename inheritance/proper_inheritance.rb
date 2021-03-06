class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size      = args[:size]
    @chain     = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args) # Bicycle both sends
  end

  def spares
    { tire_size: tire_size,
      chain:     chain }.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  # subclasses may override
  def post_initialize(args) # and implements this
    nil
  end

  def local_spares # hook for subclasses to override
    {}
  end

  def default_chain
    '10-speed' # common default
  end
end

class RoadBike < Bicycle
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

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = front_shock
    @rear_shock  = rear_shock
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size # subclass default
    '2.1'
  end

  def spares
    super.merge({ rear_shock: rear_shock })
  end
end

class RecumbantBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    { flag: flag }
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

road_bike = RoadBike.new(size: 'M', tape_color: 'red')

puts road_bike.tire_size
puts road_bike.chain

mountain_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')

puts mountain_bike.tire_size
puts mountain_bike.chain

recumbant_bike = RecumbantBike.new(flag: 'tall and orange')
puts recumbant_bike.spares 
