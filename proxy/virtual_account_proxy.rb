# Proxy: Subjectの生成のタイミングを遅らせる
# 仮想Proxyと言える
class VirtualAccountProxy
  def initialize(starting_balance)
    puts "VirtualAccountProxyを生成しましたが、まだBankAccountは生成していません"
    @starting_balance = starting_balance
  end

  def balance
    subject.balance
  end

  def deposit(amount)
    subject.deposit(amount)
  end

  def withdraw(amount)
    subject.withdraw(amount)
  end

  def announce
    "VirtualAccountProxyが担当するアナウンスです"
  end

  def subject
    @subject ||= BankAccount.new(@starting_balance)
  end
end

