module JeparB
  class Category
    def initialize(name)
      @name    = name
      @answers = { }
    end
    
    attr_reader :name, :answers

    def add_answer(answer, value)
      @answers[value] = answer
    end

    def remove_answer(value)
      @answers.delete(value)
    end
  end
end
