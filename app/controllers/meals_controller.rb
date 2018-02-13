require_relative "../views/meals_view"
class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @meals_view.display_meals(meals)
  end

  def create
    name = @meals_view.ask_for("name?")
    price = @meals_view.ask_for("price?")
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end
