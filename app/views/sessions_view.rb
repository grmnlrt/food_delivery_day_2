class SessionsView
  def ask_for(string)
    puts string
    gets.chomp
  end

  def welcome(employee)
    puts "welcome #{employee.username}"
  end

  def wrong_credentials
    puts "Wrong credentials..."
    puts "Try again"
  end
end
