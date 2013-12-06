require 'rspec'
require_relative '../lib/tax_calculator'
require_relative '../lib/employee'
require_relative '../lib/liability'

# REQUIREMENTS:

# Liability method
# * Has class method liability
# * that receives an instance of an Employee class
# * and calculates taxes owed or refund due
# * returns an instance of Liability class

describe TaxCalculator do
  let(:employee) { Employee.new('helen', 'hood', 38000, 10000, 30) }
  let(:employees) { Employee.parse_data('test_citizens.csv') }

  it 'has a class method liability' do
    expect(TaxCalculator.respond_to?(:liability)).to be true
  end

  it 'receives an instance of an Employee class' do  #FAILING
    expect {TaxCalculator.liability("some string")}.to raise_error(ArgumentError, "You must pass in an Employee object.")
  end

  it 'calculates taxes owed or refund due' do
    expect(TaxCalculator.liability(employee).amount_owed).to eql(1400.0)
    expect(TaxCalculator.liability(employee).amount_due).to eql(0)
  end

  it 'returns an instance of the Liability class' do
    expect(TaxCalculator.liability(employee)).to be_a(Liability)
  end
end
