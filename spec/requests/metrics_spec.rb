require 'rails_helper'

RSpec.describe "Metrics API", type: :request do
  describe "GET /metrics/country/:country" do
    it "returns min, max, avg salary for a country" do
      Employee.create!(full_name: "A", job_title: "Dev", country: "India", salary: 1000)
      Employee.create!(full_name: "B", job_title: "Dev", country: "India", salary: 2000)

      get "/metrics/country/India"

      expect(response.status).to eq(200)

      json = JSON.parse(response.body)

      expect(json["min"]).to eq(1000.0)
      expect(json["max"]).to eq(2000.0)
      expect(json["avg"]).to eq(1500.0)
    end
  end

  describe "GET /metrics/job_title/:job_title" do
   it "returns average salary for a job title" do
  Employee.create!(full_name: "A", job_title: "Backend Engineer", country: "India", salary: 1000)
  Employee.create!(full_name: "B", job_title: "Backend Engineer", country: "India", salary: 3000)

  get "/metrics/job_title/#{CGI.escape('Backend Engineer')}"

  expect(response.status).to eq(200)

  json = JSON.parse(response.body)

  expect(json["avg"]).to eq(2000.0)
end
  end
end