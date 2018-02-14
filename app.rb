require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"

meal_repository = MealRepository.new('data/meals.csv')
meal_controller = MealsController.new(meal_repository)
customer_repository = CustomerRepository.new('data/customers.csv')
customer_controller = CustomersController.new(customer_repository)
employee_repository = EmployeeRepository.new('data/employees.csv')
session_controller = SessionsController.new(employee_repository)
router = Router.new(meal_controller, customer_controller, session_controller)

router.run
