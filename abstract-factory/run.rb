require './organism_factory'

factory = FrogAndAlgaeFactory.new(4, 1)
animals = factory.get_animals
animals.each { |animal| animal.eat }

plants = factory.get_plants
plants.each { |plant| plant.grow }

factory = DuckAndWaterLilyFactory.new(3, 2)
animals = factory.get_animals
animals.each { |animal| animal.eat }

plants = factory.get_plants
plants.each { |plant| plant.grow }
