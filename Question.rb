class Question 

  attr_reader :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2 
  end

  def print_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def right_answer?(user_response)
    user_response == @answer
  end
end
