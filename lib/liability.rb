class Liability
  attr_reader :employee, :amount_due, :amount_owed

  def initialize(employee, amount_due, amount_owed)
    @employee = employee
    @amount_due = amount_due
    @amount_owed = amount_owed
  end
end
