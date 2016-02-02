if preparer.kind_of?(Mechanic)
  preparer.prepare_bicycles(bicycle)
elsif preparer.kind_of?(TripCoordinator)
  preparer.buy_food(customers)
elsif preparer.kind_of?(Driver)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end
