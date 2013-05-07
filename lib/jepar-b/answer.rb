module JeparB
  class Answer
    def initialize(answer, question)
      @answer, @question = answer, question
    end

    def show_answer
      @answer
    end

    def show_question
      @question
    end
  end
end
