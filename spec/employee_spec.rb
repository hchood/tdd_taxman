require 'rspec'
require_relative '../lib/employee'

describe Employee do
  let(:employees) { Employee.parse_data('../data/citizens.csv')}

  it 'creates an array' do
    expect(employees.class).to eql(Array)
  end

  it 'creates an array of 5 objects' do
    expect(employees.length).to eql(5)
  end

  it 'creates an array of Employee objects' do
    expect(employees.first.class).to eql(Employee)
  end

  it 'has a first name' do
    expect(Employee.new('Helen', 'Hood', 38000, 10000, 30).first_name).to eql('Helen')
  end

  it 'has a last name'do
    expect(Employee.new('Helen', 'Hood', 38000, 10000, 30).last_name).to eql('Hood')
  end

  it 'has an annual income'do
    expect(Employee.new('Helen', 'Hood', 38000, 10000, 30).annual_income).to eql(38000.0)
  end

  it 'has a tax paid amount'do
    expect(Employee.new('Helen', 'Hood', 38000, 10000, 30).tax_paid).to eql(10000.0)
  end

  it 'has a tax rate'do
    expect(Employee.new('Helen', 'Hood', 38000, 10000, 30).tax_rate).to eql(30.0)
  end

  it 'can instantiate an Employee object with all existing data when all data is present' do
    expect(employees.first.first_name).to eql('Johnny')
    expect(employees.first.last_name).to eql('Smith')
    expect(employees.first.annual_income).to eql(120000.0)
    expect(employees.first.tax_paid).to eql(28000.0)
    expect(employees.first.tax_rate).to eql(38.0)
  end

  it 'still creates an Employee object where name data is missing, but uses a placeholder for the value' do
    expect(employees[3].first_name).to eql('[First name]')
  end

  it 'still creates an Employee object where $ data is missing, but sets that value to 0' do
    expect(employees[2].annual_income).to eql(0.0)
    expect(employees[4].tax_paid).to eql(0.0)
  end
end

# Employee class
# * can instantiate where all expected data is present
# * handles cases where data is missing
