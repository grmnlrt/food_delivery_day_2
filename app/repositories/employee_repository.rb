require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username}
  end

  def all
    @employees
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      @employees << Employee.new(row)
      @next_id = row[:id] + 1
    end
  end
end
