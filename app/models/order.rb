class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer
  def initialize(attributes = {})
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered] || false
    @id = attributes[:id]
  end

  def delivered?
    @delivered
  end

  def mark_as_delivered!
    @delivered = true
  end
end
