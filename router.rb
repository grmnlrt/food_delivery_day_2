class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome"
    while @running
      # 1.Print the menu
      puts "---------------------"
      puts "What next?"
      puts "1. List meals"
      puts "2. Create a meal"
      puts "3. List customers"
      puts "4. Create a customer"
      puts "9. Exit"
      print "> "

      # 2. Ask the user what he/she wants to do next?
      action = gets.chomp.to_i
      print `clear`

      # 3. Call the right controller method
      case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.create
      when 3 then @customers_controller.list
      when 4 then @customers_controller.create
      when 9 then stop
      else
        puts "Dummy"
      end
    end
  end

  private

  def stop
    @running = false
  end
end
