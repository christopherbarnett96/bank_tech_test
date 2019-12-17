class Account
  DEFAULT_MIN_BALANCE = 0.00


  attr_reader :balance


  def initialize
    @balance = DEFAULT_MIN_BALANCE
  end

  def add(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

  def statement
    print "\"date || credit || debit || balance\"\n"
  end
end
