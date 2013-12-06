require 'rspec'
require_relative '../lib/liability'
require_relative '../lib/employee'

describe Liability do
  employee_no_refund = Employee.new('helen', 'hood', 38000, 10000, 30) # => owes $1400 to IRS
  let(:liability1) { TaxCalculator.liability(employee_no_refund) }

  employee_w_refund = Employee.new('jon', 'barry', 50000, 15000, 28) # => should receive $1000 refund
  let(:liability2) { TaxCalculator.liability(employee_w_refund) }

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
