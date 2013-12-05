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
end

# Employee class
# * can instantiate where all expected data is present
# * handles cases where data is missing
