require 'rails_helper'

RSpec.describe "Employees API", type: :request do
  describe "POST /employees" do
    it "creates an employee" do
      post "/employees", params: {
        employee: {
          full_name: "Abhishek Anand",
          job_title: "Backend Engineer",
          country: "India",
          salary: 50000
        }
      }

      expect(response.status).to eq(201)
    end
  end
  describe "GET /employees" do
  it "returns all employees" do
    Employee.create!(
      full_name: "Abhishek Anand",
      job_title: "Backend Engineer",
      country: "India",
      salary: 50000
    )

    get "/employees"

    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json.length).to eq(1)
  end
end
end



