module UserInput
  TAB = "\n\s\s\s\s"

  def get_user_input(prompt_message, regexp) #uses regular expression to verify user input
    loop do
      puts TAB + prompt_message
      input = gets.chomp.downcase
      if input.match?(regexp)
        return input
      else
        puts TAB + "Invalid input."
      end
    end
  end

  module_function :get_user_input  #allows method to also be used as a module function

end