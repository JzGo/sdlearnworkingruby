class Response
  @@responses = []
  @@dummies = []

  def self.add_response question, *answers
    @@responses << new(question, answers)
  end

  def self.add_dummies *dummies
    @@dummies += dummies
  end

  def self.get_answer question
    responses = @@responses.select{|r| r.good_for? question}
    if responses.length > 0
      responses.sample.get_answers.sample
    else
      @@dummies.sample
    end
  end

  def initialize question, answers
    @question = question.map{|q| q.downcase}
    @answers = answers
  end

  def good_for? question
    @question.any?{|q| question.downcase.include? q}
  end

  def get_answers
    @answers
  end
end
