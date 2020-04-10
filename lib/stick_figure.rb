class StickFigure

  attr_accessor :parts

  def initialize
    @parts = set_body_parts(0)
  end

  public

  def display
    puts "             "
    puts "    _________"
    puts "   |         |"
    puts "   |         |"
    puts "   #{parts[0]}         |"
    puts "  #{parts[1]}#{parts[3]}#{parts[2]}        |"
    puts "   #{parts[4]}         |    "
    puts "  #{parts[5]} #{parts[6]}        |"
    puts "             |"
    puts "           _____"
    puts "          /     \\"
    puts "                  "
  end

  def set_body_parts(body_parts)
    raise_exception if (body_parts > 7) || (body_parts < 0) 
    case body_parts
    when 0
      self.parts = [" "," "," "," "," "," "," "]
    when 1
      self.parts = ["o"," "," "," "," "," "," "]
    when 2
      self.parts = ["o"," "," ","|"," "," "," "]
    when 3
      self.parts = ["o","\\"," ","|"," "," "," "]
    when 4
      self.parts = ["o","\\","/","|"," "," "," "]
    when 5
      self.parts = ["o","\\","/","|","|"," "," "]
    when 6
      self.parts = ["o","\\","/","|","|","/"," "]
    else
      self.parts = ["o","\\","/","|","|","/","\\"]
    end
  end

  private

  def raise_exception
    raise 'body parts must be an integer between 0 and 7'
  end
end








