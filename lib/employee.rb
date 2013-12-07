require 'csv'

class Employee
  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate

  def initialize(first_name = '[First name]', last_name = '[Last name]', annual_income = 0, tax_paid = 0, tax_rate = 0)
    @first_name = first_name || '[First name]'
    @last_name = last_name || '[Last name]'
    @annual_income = annual_income.to_f
    @tax_paid = tax_paid.to_f
    @tax_rate = tax_rate.to_f
  end

  def self.parse_data(filename)
    employees = []
    CSV.foreach(filename, headers: true) do |row|
      employees << Employee.new(row["first_name"], row["last_name"], row["annual_income"], row["tax_paid"], row["tax_rate"])
    end
    employees
  end
end

