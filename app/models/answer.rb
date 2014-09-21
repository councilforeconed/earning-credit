class Answer
  
  attr_reader :text, :value
  
  def initialize(params)
    @text = params["text"]
    @value = params["value"]
  end
  
end