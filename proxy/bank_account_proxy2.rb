# BankAccountのmethod_missingを使った実装
class BankAccountProxy2
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    @real_object.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end
