class Response
  @@responses = []
  @@dummies = []

  def self.add_response question, *answers
    @@responses << new(question, answers)
  end

  def self.add_dummies *dummies
    @@dummies << dummies
  end

  def self.get_answer question
    responses = @@responses.select{|r| r.good_for? question}
    if responses.length > 0
      responses.sample.get_answers.sample
    else
      @@dummies.sample
      dummy_responses = @@dummies.sample
      dummy_responses.sample  # A 'puts' here adds a newline.
    end
  end

  def initialize question, answers
    if question.class == Array                  # *Attempting array q addition
      @questions = question.map {|q| q.downcase}
      @answers = answers
    else
      @question = question.downcase    # CHALLENGED TO KEEP CURRENT FUNCTION OF PROGRAM:
    end                               # RELEVANT RESPONSES EVEN WITH 'RESPONSE' 'INSIDE' INPUT
      @answers = answers
    # end
  end

  # Question array is successfully downcased. Error: no implicit conversion of array to string in g_for

  def good_for? question
    if question.class == Array
      @questions.any? {|q| q.include? question}            #Call starts on question w/o @
    else
      question.include? @question          #This checks if user_in = any existing 'questions'
    end
  end                                      #So 'question' here refers to x in x, y, y in e_q file

  def get_answers
    @answers
  end
end
