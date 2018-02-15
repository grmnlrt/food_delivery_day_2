require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @orders = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    load_csv

  end

  def undelivered
    @orders.reject do |order|
      order.delivered?
    end
  end

  def add(order)
     order.id = @next_id
     @orders << order
     @next_id += 1
     save_csv
  end

  def save
    save_csv
  end

  def find(id)
    @orders.find {|order| order.id == id}
  end


  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:delivered]    = row[:delivered] == "true"        # Convert column to Integer
      row[:meal_id]    = row[:meal_id].to_i          # Convert column to Integer
      row[:customer_id]  = row[:customer_id].to_i
      row[:employee_id]  = row[:employee_id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id])
      row[:customer] = @customer_repository.find(row[:customer_id])
      row[:employee] = @employee_repository.find(row[:employee_id])
      @orders << Order.new(row)
      @next_id = row[:id] + 1
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w(id delivered meal_id customer_id employee_id)
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
