# Create a player of the "Diameterizable" role
class DiameterDouble
  def diameter
    10
  end
end

class GearTest
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog: 11,
            wheel: DiameterDouble.new)

    assert_in_delta(137.1, gear.gear_inches, 0.01)
  end
end
