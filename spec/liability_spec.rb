require 'rspec'
require_relative '../lib/liability'
require_relative '../lib/employee'

describe Liability do
  an_employee = Employee.new('helen', 'hood', 38000, 10000, 30)
  let(:liability) { Liability.new(an_employee, 1000, 0)}
  it 'has (and exposes) an employee' do
    expect(liability.employee).to eql(an_employee)
  end

  it 'has (and exposes) an amount due' do
    expect(liability.amount_due). to eql(1000)
  end

  it 'has (and exposes) an amount owed' do
    expect(liability.amount_owed). to eql(0)
  end
end

# REQUIREMENTS:
# * Liability class must expose 3 properties:
# * employee (must be instance of Employee class)
# * amount_due
# * amount_owed
