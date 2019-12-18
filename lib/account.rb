require_relative 'statement'

class Account
  DEFAULT_MIN_BALANCE = 0.00

  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = DEFAULT_MIN_BALANCE
    @statement = statement
  end

  def add(value)
    @balance += value
    add_event(deposit_amount: value)
    return "You have deposited #{format_money(value)}"
  end

  def withdraw(value)
    @balance -= value
    add_event(withdrawal_amount: value)
    return "You have withdrawn #{format_money(value)}"
  end

  def statement
    @statement.show
  end

  def add_event(deposit_amount: nil, withdrawal_amount: nil)
    if deposit_amount
      @statement.activity.unshift("#{Time.now.strftime('%d/%m/%Y')} || #{format(deposit_amount)} || || #{format(@balance)}")
    elsif withdrawal_amount
      @statement.activity.unshift("#{Time.now.strftime('%d/%m/%Y')} || || #{format(withdrawal_amount)} || #{format(@balance)}")
    end
  end

  def format(value)
    '%.2f' % value
  end
end
