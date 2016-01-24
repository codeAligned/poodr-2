class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * diameter
  end

  def diameter # Move this message to a dependency into its own method
    wheel.diameter
  end
end

