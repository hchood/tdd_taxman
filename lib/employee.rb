require 'csv'

class Employee
  def self.parse_data(filename)
    @@employees = []
    CSV.foreach(filename, headers: true) do |row|
      @@employees << Employee.new()
    end
    @@employees
  end
end
