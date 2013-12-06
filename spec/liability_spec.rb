require 'rspec'
require_relative '../lib/liability'
require_relative '../lib/employee'
require_relative '../lib/tax_calculator'

# REQUIREMENTS:
# * Liability class must expose 3 properties:
# * employee (must be instance of Employee class)
# * amount_due (amount due to the employee from IRS)
# * amount_owed (amount owed to the IRS)

describe Liability do
  let(:employee_no_refund) { Employee.new('helen', 'hood', 38000, 10000, 30) } # => owes $1400 to IRS
  let(:liability1) { TaxCalculator.liability(employee_no_refund) }

  let(:employee_w_refund) { Employee.new('jon', 'barry', 50000, 15000, 28) } # => should receive $1000 refund
  let(:liability2) { TaxCalculator.liability(employee_w_refund) }

  it 'has (and exposes) an employee' do
    expect(liability1.employee).to eql(employee_no_refund)
  end

  it 'has (and exposes) an amount due' do
    expect(liability1.amount_due).to eql(0)
  end

  it 'has (and exposes) an amount owed' do
    expect(liability1.amount_owed).to eql(1400.0)
  end

  it 'ensures that if amount_owed is positive, amount_due is zero (& vice versa)' do
    expect(liability2.amount_owed).to eql(0)
    expect(liability2.amount_due).to eql(1000.0)
  end
end
