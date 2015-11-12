require './instrument_factory'

factory = SaxophoneFactory.new(3)
saxophones = factory.ship_out
saxophones.each { |saxophone| saxophone.play }

factory = TrumpetFactory.new(2)
trumpets = factory.ship_out
trumpets.each { |trumpet| trumpet.play }
