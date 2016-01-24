class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire) # requires a rim and tire; Gear also knows the order of the rim and tire arguments
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter # dependency: Expects a class named Wheel; also expects a wheel to respond to #diameter.
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
