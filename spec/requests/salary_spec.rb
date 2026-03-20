require 'rails_helper'

RSpec.describe "Salary API", type: :request do
  describe "GET /employees/:id/salary" do
    it "calculates salary for India" do
      employee = Employee.create!(
        full_name: "Abhishek Anand",
        job_title: "Backend Engineer",
        country: "India",
        salary: 1000
      )

      get "/employees/#{employee.id}/salary"

      expect(response.status).to eq(200)

      json = JSON.parse(response.body)

      expect(json["gross"]).to eq(1000)
      expect(json["deduction"]).to eq(100)
      expect(json["net"]).to eq(900)
    end

    it "calculates salary for United States" do
  employee = Employee.create!(
    full_name: "Mark Zuckerberg",
    job_title: "Backend Engineer",
    country: "United States",
    salary: 1000
  )

  get "/employees/#{employee.id}/salary"

  json = JSON.parse(response.body)

  expect(json["deduction"]).to eq(120)
  expect(json["net"]).to eq(880)
end

it "calculates salary for other countries with no deduction" do
  employee = Employee.create!(
    full_name: "Rahul Singh",
    job_title: "Backend Engineer",
    country: "Germany",
    salary: 1000
  )

  get "/employees/#{employee.id}/salary"

  json = JSON.parse(response.body)

  expect(json["deduction"]).to eq(0)
  expect(json["net"]).to eq(1000)
end
  end
  
end