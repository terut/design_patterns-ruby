require './water_with_material_builder'
require './director'
require './sugar_water'
require './salt_water'

builder = WaterWithMaterialBuilder.new(SugarWater)
director = Director.new(builder)
director.cook
p builder.result

builder = WaterWithMaterialBuilder.new(SaltWater)
director = Director.new(builder)
director.cook
p builder.result
