require_relative 'statement'

class Account
  DEFAULT_MIN_BALANCE = 0.00


  attr_reader :balance


  def initialize(statement=Statement.new)
    @balance = DEFAULT_MIN_BALANCE
    @statement = statement
  end

  def add(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

  def statement
    @statement.show
  end


end
