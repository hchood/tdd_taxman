class Liability
  attr_reader :employee, :amount_due, :amount_owed

  def initialize(employee, amount_to_pay)
    @employee = employee
    if amount_to_pay >= 0
      @amount_owed = amount_to_pay.abs
      @amount_due = 0
    else
      @amount_owed = 0
      @amount_due = amount_to_pay.abs
    end
  end
end
