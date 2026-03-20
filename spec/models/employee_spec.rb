require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is invalid without full_name" do
    employee = Employee.new(full_name: nil)
    expect(employee).not_to be_valid
  end
end