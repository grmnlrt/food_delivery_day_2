require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"

meal_repository = MealRepository.new('data/meals.csv')
meal_controller = MealsController.new(meal_repository)
customer_repository = CustomerRepository.new('data/customers.csv')
customer_controller = CustomersController.new(customer_repository)
router = Router.new(meal_controller, customer_controller)

router.run
