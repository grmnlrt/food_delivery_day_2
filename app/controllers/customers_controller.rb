require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @view = CustomersView.new
    @customer_repository = customer_repository
  end

  def list
    customers = @customer_repository.all
    @view.display_list(customers)
  end

  def create
    name = @view.ask_for("name?")
    address = @view.ask_for("address?")
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end
