# When Gear is part of an external interface

module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end

    #...
  end
end

# Wrap the interface to proctec yourself from changes

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], args[:cog], args[:wheel])
  end
end
