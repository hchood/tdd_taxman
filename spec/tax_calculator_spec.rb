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

  it 'has a class method summary_info' do
    expect(TaxCalculator.respond_to?(:summary_info)).to be true
  end

  it 'returns an array of strings including employee first and last name' do
    expect(TaxCalculator.summary_info(employees).first).to include('Johnny')
    expect(TaxCalculator.summary_info(employees).first).to include('Smith')
  end

  it 'returns "has a tax liability of $[amount_due]" for an employee who owes money' do
    expect(TaxCalculator.summary_info(employees)[2]).to include('will receive a refund of $21,000')
  end

  it 'returns "will receive a refund of $[refund amount]" for an employee who should get a refund' do
    expect(TaxCalculator.summary_info(employees)[0]).to include('has a tax liability of $17,600')
  end

  it 'does NOT include refund amount for employees who do not receive refunds' do
    TaxCalculator.summary_info(employees)[0].should_not include('will receive a refund')
  end

  it 'does NOT include amount owed for employees who do not owe money' do
    TaxCalculator.summary_info(employees)[2].should_not include('has a tax liability of')
  end
end
