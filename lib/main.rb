require 'csv'
require 'rspec'

require_relative 'liability'
require_relative 'employee'
require_relative 'tax_calculator'

employees = Employee.parse_data('../data/citizens.csv')
array_of_employee_strings = TaxCalculator.summary_info(employees)
array_of_employee_strings.each do |string|
  puts string
end
