class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# Gear expects a 'Duck' that knows 'diameter'
puts Gear.new(52, 11, 26, 1.5).gear_inches
