require_relative 'employee'
require_relative 'liability'

class TaxCalculator
  def self.liability(employee)
    amount_owed = (employee.annual_income * employee.tax_rate/100) - employee.tax_paid
    Liability.new(employee, amount_owed)
  end
end
