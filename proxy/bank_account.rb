# Subject: 銀行の窓口業務（入金/出金）
class BankAccount
  attr_reader :balance

  def initialize(balance)
    puts "BankAccountを生成しました"
    @balance = balance
  end

  # 入金
  def deposit(amount)
    @balance += amount
  end

  # 出金
  def withdraw(amount)
    @balance -= amount
  end
end
