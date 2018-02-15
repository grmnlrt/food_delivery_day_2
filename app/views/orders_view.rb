class OrdersView
  def display(list)
    list.each do |element|
      puts "#{element.id} - #{element.meal.name} - livreur : #{element.employee.username}"
    end
  end

  def display_meals(all_meals)
    all_meals.each do |meal|
      puts "#{meal.id}, #{meal.name}"
    end
  end

  def display_customer(all_customers)
    all_customers.each do |customer|
      puts "#{customer.id}, #{customer.name}"
    end
  end

  def display_employees(all_employees)
    all_employees.each do |employee|
      puts "#{employee.id}, #{employee.username}"
    end
  end

  def ask_for_id
    puts "id?"
    gets.chomp.to_i
  end

end
