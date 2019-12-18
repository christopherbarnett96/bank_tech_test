class Statement
  attr_accessor :activity

  def initialize
    @activity = []
  end

  def show
    print "\"date || credit || debit || balance\"\n"
    @activity.each { |event| p event }
  end
end
