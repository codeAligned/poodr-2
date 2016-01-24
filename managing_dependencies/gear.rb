class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40 #Explicitly define defaults
    @cog = args[:cog] || 18
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * diameter
  end

  def diameter # Move this message to a dependency into its own method
    wheel.diameter
  end
end

Gear.new(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5)).gear_inches
