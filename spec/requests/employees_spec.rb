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

describe "GET /employees/:id" do
  it "returns a specific employee" do
    employee = Employee.create!(
      full_name: "Abhishek Anand",
      job_title: "Backend Engineer",
      country: "India",
      salary: 50000
    )

    get "/employees/#{employee.id}"

    expect(response.status).to eq(200)

    json = JSON.parse(response.body)
    expect(json["id"]).to eq(employee.id)
  end
end

describe "PATCH /employees/:id" do
  it "updates an employee" do
    employee = Employee.create!(
      full_name: "Abhishek Anand",
      job_title: "Backend Engineer",
      country: "India",
      salary: 50000
    )

    patch "/employees/#{employee.id}", params: {
      employee: {
        job_title: "Senior Backend Engineer"
      }
    }

    expect(response.status).to eq(200)

    json = JSON.parse(response.body)
    expect(json["job_title"]).to eq("Senior Backend Engineer")
  end
end
end



