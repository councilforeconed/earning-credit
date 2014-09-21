class Question
  
  attr_reader :number, :description, :answers
  
  def initialize(params)
    @number = params["number"]
    @description = params["question"]
    @answers = params["answers"].map { |answer| Answer.new(answer) }
  end
  
end