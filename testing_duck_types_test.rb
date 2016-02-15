module PreparerInterfaceTest
  def test_implements_the_preparer_interface
    assert_respond_to(@object, :prepare_trip)
  end
end

class MechanicTest
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end

  # other tests that rely on @mechanic
end

class TripCoordinator
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end

class TripTest

  def test_requests_trip_preparation
    @preparer = MiniTest::Mock.new
    @trip = Trip.new
    @preparer.expect(:prepare_trip, nil, [@trip])

    @trip.prepare([@preparer])
    @preparer.verify
  end
end
