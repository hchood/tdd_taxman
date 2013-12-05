require 'rspec'
require_relative '../lib/employee'

describe Employee do
  let(:employees) { Employee.parse_data('../data/citizens.csv')}

  it 'reads in data and creates an array' do
    expect(employees.class).to eql(Array)
  end

  it 'creates an array of 5 objects' do
    expect(employees.length).to eql(5)
  end

  it 'creates an array of Employee objects' do
    expect(employees.first.class).to eql(Employee)
  end

  it 'can instantiate an Employee object with all existing data when all data is present' do
    expect(employees.first.first_name).to eql('Johnny')
    expect(employees.first.last_name).to eql('Smith')
    expect(employees.first.annual_income).to eql(120000)
    expect(employees.first.tax_paid).to eql(28000)
    expect(employees.first.tax_rate).to eql(38)
  end

  it 'still creates an Employee object where data is missing, but lets the value for that attribute be nil' do\

  end
end

# Employee class
# * can instantiate where all expected data is present
# * handles cases where data is missing
