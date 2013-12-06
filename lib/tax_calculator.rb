require_relative 'employee'
require_relative 'liability'

class TaxCalculator
  def self.liability(employee)
    unless employee.is_a?(Employee)
      raise ArgumentError, "You must pass in an Employee object."
    else
      amount_owed = (employee.annual_income * employee.tax_rate/100) - employee.tax_paid
      liabiliity_obj = Liability.new(employee, amount_owed)
    end
    liabiliity_obj
  end

  def self.summary_info(employees)
    employee_info_array = []
    employees.each do |employee|
      refund = TaxCalculator.liability(employee).amount_due
      taxes_owed = TaxCalculator.liability(employee).amount_owed
      if refund > 0
        string = "#{employee.first_name} #{employee.last_name} will receive a refund of $#{money_format(refund)}"
      else
        string = "#{employee.first_name} #{employee.last_name} has a tax liability of $#{money_format(taxes_owed)}"
      end
      employee_info_array << string
    end
    employee_info_array
  end

  private
  def self.money_format(number)
    formatted_number = sprintf('%.0f', number.to_i)
    formatted_number.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end
end
