module DiamterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :width)
  end
end

# Create a player of the "Diameterizable" role
class DiameterDouble
  def width
    10
  end
end

# Prove the test double honors the interface this test expects
class DiameterDoubleTest < MiniTest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
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
