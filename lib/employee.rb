require 'csv'

class Employee
  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate

  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income.to_i
    @tax_paid = tax_paid.to_i
    @tax_rate = tax_rate.to_i
  end

  def self.parse_data(filename)
    @@employees = []
    CSV.foreach(filename, headers: true) do |row|
      @@employees << Employee.new(row["first_name"], row["last_name"], row["annual_income"], row["tax_paid"], row["tax_rate"])
    end
    @@employees
  end
end
