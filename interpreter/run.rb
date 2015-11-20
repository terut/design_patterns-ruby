require './expression'
require './and'
require './or'
require './not'
require './all'
require './filename'
require './bigger'
require './writable'

complex_expression1 = And.new(FileName.new('*.rb'), FileName.new('a*'))
puts "And.new(FileName.new('*.rb'), FileName.new('a*'))"
puts complex_expression1.evaluate('./')

complex_expression2 = Bigger.new(450)
puts "Bigger.new(450)"
puts complex_expression2.evaluate('./')

complex_expression3 = FileName.new('*.rb') & FileName.new('a*')
puts "FileName.new('*.rb') & FileName.new('a*')"
puts complex_expression3.evaluate('./')

complex_expression4 = Writable.new | Bigger.new(300)
puts "Writable.new | Bigger.new(300)"
puts complex_expression4.evaluate("./")

complex_expression5 = All.new & Not.new(Bigger.new(300))
puts "All.new & Not.new(Bigger.new(300))"
puts complex_expression5.evaluate('./')
