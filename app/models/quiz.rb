class Quiz
  
  attr_reader :type, :questions
  
  def initialize(type, filename)
    @type = type
    @questions = YAML.load_file(filename).map { |question| Question.new(question) }
  end
  
end