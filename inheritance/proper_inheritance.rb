class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size      = args[:size]
    @chain     = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed' # common default
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def spares
    { tire_size: tire_size,
      chain:     chain }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # RoadBike now must send super
  end

  def default_tire_size # subclass default
    '23'
  end

  def spares
    super.merge({ tape_color: tape_color })
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = front_shock
    @rear_shock  = rear_shock
    super(args)
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

  def initialize(args)
    @flag = args[:flag] # forgot to send super!
  end

  def spares
    super.merge({ flag: flag })
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
