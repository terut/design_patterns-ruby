require './duck'
require './frog'
require './algae'
require './water_lily'

class OrganismFactory
  def initialize(number_animals, number_plants)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("Animal #{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_plant("Plant #{i}")
      @plants << plant
    end
  end

  def get_plants
    @plants
  end

  def get_animals
    @animals
  end
end

class FrogAndAlgaeFactory < OrganismFactory
  private
  def new_animal(name) 
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end

class DuckAndWaterLilyFactory < OrganismFactory
  private
  def new_animal(name)
    Duck.new(name)
  end

  def new_plant(name)
    WaterLily.new(name)
  end
end
