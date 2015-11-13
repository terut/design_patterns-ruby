require 'singleton'

class SingletonObject
  include Singleton
  attr_accessor :counter

  def initialize
    @counter = 0
  end
end
