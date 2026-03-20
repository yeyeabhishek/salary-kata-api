class SalaryCalculator
  def self.call(employee)
    gross = employee.salary.to_f

    deduction = case employee.country
                when "India"
                  gross * 0.10
                when "United States"
                  gross * 0.12
                else
                  0
                end

    net = gross - deduction

    {
      gross: gross,
      deduction: deduction,
      net: net
    }
  end
end