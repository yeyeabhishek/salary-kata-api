class MetricsController < ApplicationController
  def by_country
    employees = Employee.where(country: params[:country])

    render json: {
      min: employees.minimum(:salary).to_f,
      max: employees.maximum(:salary).to_f,
      avg: employees.average(:salary).to_f
    }, status: :ok
  end

#   def by_job_title
#     employees = Employee.where(job_title: params[:job_title])

#     render json: {
#       avg: employees.average(:salary).to_f
#     }, status: :ok
#   end

def by_job_title
  job_title = CGI.unescape(params[:job_title])   # 👈 FIX

  employees = Employee.where(job_title: job_title)

  render json: {
    avg: employees.average(:salary).to_f
  }, status: :ok
end
end