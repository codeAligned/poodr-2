class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size      = args[:size]
    @chain     = args[:chain]
    @tire_size = args[:tire_size]
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # RoadBike now must send super
  end
end

class MountainBike < Bicycle
end

