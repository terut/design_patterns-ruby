require './old_printer'

class Adapter
  def initialize(string)
    @old_printer = OldPrinter.new(string)
  end

  def print_weak
    @old_printer.show_with_paren
  end

  def print_strong
    @old_printer.show_with_aster
  end
end
