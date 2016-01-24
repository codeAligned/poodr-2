class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args.fetch(:chainring, 40) # Use of fetch to set defaults
    @cog = args.fetch(:cog, 18)
    @wheel = args.fetch(:wheel)
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
