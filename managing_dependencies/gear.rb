class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args) # Use of a defaults wrapping method
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * diameter
  end

  def diameter # Move this message to a dependency into its own method
    wheel.diameter
  end

  def defaults
    { :chainring => 40, :cog => 18 }
  end
end

Gear.new(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5)).gear_inches
