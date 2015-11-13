# Adaptee
class OldPrinter
  def initialize(string)
    @string = string.dup
  end

  def show_with_paren
    puts "(#{@string})"
  end

  def show_with_aster
    puts "*#{@string}*"
  end
end
