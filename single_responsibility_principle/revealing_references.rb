class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data) # deal with the data structure during initialization
  end

  def diameters
    wheels.map do |wheel|
      wheel.rim + (wheel.tire * 2) # now everyone can send rim/tire to wheel
    end
  end

  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.map do |cell|
      Wheel.new(cell[0], cell[1]) # Now we only have to deal with the data structure once
    end
  end
end
