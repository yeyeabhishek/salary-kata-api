require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is invalid without full_name" do
    employee = Employee.new(full_name: nil)
    expect(employee).not_to be_valid
  end
  it "is invalid without job_title" do
  employee = Employee.new(job_title: nil)
  expect(employee).not_to be_valid
end

it "is invalid without country" do
  employee = Employee.new(country: nil)
  expect(employee).not_to be_valid
end

it "is invalid without salary" do
  employee = Employee.new(salary: nil)
  expect(employee).not_to be_valid
end

it "is invalid with salary <= 0" do
  employee = Employee.new(salary: 0)
  expect(employee).not_to be_valid
end
end