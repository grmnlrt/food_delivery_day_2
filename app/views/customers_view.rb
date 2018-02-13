class CustomersView
  def display_list(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} (#{customer.address})"
    end
  end

  def ask_for(string)
    puts string
    gets.chomp
  end
end
