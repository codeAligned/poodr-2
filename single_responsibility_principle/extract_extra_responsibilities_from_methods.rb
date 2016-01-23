# This method has two responsibilities: iterating over the wheels; calculating
# the diameter of each wheel

def diameters
  wheels.map do |wheel|
    wheel.rim + (wheel.tire + 2)
  end
end

# Extract methods so each method does one thing

# first method - iterate over array
def diamaters
  wheels.map { |wheel| diameter(wheel) }
end

# second method - calculate diameter of ONE wheel

def diameter(wheel)
  wheel.rim + (wheel.tire + 2)
end
