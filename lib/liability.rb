class Liability
  attr_reader :employee, :amount_due, :amount_owed

  def initialize(employee, amount_owed)
    @employee = employee
    if amount_owed >= 0
      @amount_owed = amount_owed.abs
      @amount_due = 0
    else
      @amount_owed = 0
      @amount_due = amount_owed.abs
    end
  end
end
