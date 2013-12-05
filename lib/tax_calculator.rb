require_relative 'employee'
require_relative 'liability'

class TaxCalculator
  def self.liability(employee)
    unless employee.is_a?(Employee)
      raise ArgumentError, "You must pass in an Employee object."
    else
      amount_owed = (employee.annual_income * employee.tax_rate/100) - employee.tax_paid
      Liability.new(employee, amount_owed)
    end
  end
end
