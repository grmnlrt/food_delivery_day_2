class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    puts "Welcome"
    @employee = @sessions_controller.sign_in
    while @employee
      if @employee.manager?
        # 1.Print the menu
        display_tasks_manager
        # 2. Ask the user what he/she wants to do next?
        action = ask_user_for
        # 3. Call the right controller method
        route_action_manager(action)
      else
        # 1.Print the menu
        display_tasks_delivery_guy
        # 2. Ask the user what he/she wants to do next?
        action = ask_user_for
        # 3. Call the right controller method
        route_action_delivery_guy(action)
      end
    end
  end

  private

  def display_tasks_manager
    puts "---------------------"
    puts "What next?"
    puts "1. List meals"
    puts "2. Create a meal"
    puts "3. List customers"
    puts "4. Create a customer"
    puts "5. List undelivered order"
    puts "6. Add an order"
    puts "8. Logout"
    puts "9. Exit"
    print "> "
  end

  def display_tasks_delivery_guy
    puts "---------------------"
    puts "What next?"
    puts "1. View my orders"
    puts "2. Mark as done"
    puts "8. Logout"
    puts "9. Exit"
    print "> "
  end

  def ask_user_for
    action = gets.chomp.to_i
    print `clear`
    return action
  end

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 5 then @orders_controller.list_undelivered
    when 6 then @orders_controller.create
    when 8 then @employee = @sessions_controller.sign_in
    when 9 then stop
    else
      puts "Dummy"
    end
  end

  def route_action_delivery_guy(action)
    case action
    when 1 then @orders_controller.list_my_order(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 8 then @employee = @sessions_controller.sign_in
    when 9 then stop
    else
      puts "Dummy"
    end
  end

  def stop
    @employee = nil
  end
end
