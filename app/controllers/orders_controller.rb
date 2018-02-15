require_relative "../views/orders_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def list_undelivered
    orders = @order_repository.undelivered
    @view.display(orders)
  end

  def create
    all_meals = @meal_repository.all
    @view.display_meals(all_meals)
    id = @view.ask_for_id
    meal = @meal_repository.find(id)

    all_customer = @customer_repository.all
    @view.display_customer(all_customer)
    id = @view.ask_for_id
    customer = @customer_repository.find(id)

    all_employees = @employee_repository.all
    @view.display_employees(all_employees)
    id = @view.ask_for_id
    employee = @employee_repository.find(id)

    order_new = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order_new)
  end

  def list_my_order(employee)
    orders = @order_repository.undelivered.select do |order|
      order.employee == employee
    end
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_order(employee)
    order_id = @view.ask_for_id
    order = @order_repository.find(order_id)
    order.mark_as_delivered!
    @order_repository.save
  end
end
