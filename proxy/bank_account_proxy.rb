# Proxy: ユーザー認証を担当
# 防御Proxyと言えるこのクラスを通じてSubjectを操作する

# etcはRubyの標準ライブラリで、/etcに存在するデータベースから情報を得る
# ユーザ認証のためのユーザ名を取得するために使う
require 'etc'

class BankAccountProxy
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def balance
    check_access
    @real_object.balance
  end

  def deposit(amount)
    check_access
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @real_object.withdraw(amount)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end
