if preparer.responds_to?(:prepare_bicycles)
  preparer.prepare_bicycles(bicycle)
elsif preparer.responds_to?(:buy_food)
  preparer.buy_food(customers)
elsif preparer.responds_to?(:gas_up)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end
