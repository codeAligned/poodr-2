require "./testing_incoming_messages"
require "minitest"

class WheelTest < Minitest::Test
  def setup
    @wheel = Wheelnew(26, 1.5)
  end

  def test_implements_the_diameterizable_interface
    assert_respond_to(@wheel, :diameter)
  end

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29, wheel.diameter, 0.01)
  end
end
