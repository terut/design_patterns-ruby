require './bank_account'
require './bank_account_proxy'
require './virtual_account_proxy'

proxy = VirtualAccountProxy.new(100)
puts proxy.announce
puts proxy.deposit(50)
puts proxy.withdraw(10)

puts "\n"

p "Login user"
account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, `whoami`.chomp)
puts proxy.deposit(50)
puts proxy.withdraw(10)

puts "\n"

p "Guest user"
account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, "guest")
puts proxy.deposit(50)

