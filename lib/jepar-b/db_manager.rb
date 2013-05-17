require 'pg'

module JeparB
  class DBManager
    def initialize(name)
      @connection = PG.connect(dbname: name)
    end
    attr_reader :connection

    def add(category, value, answer, question)
      @connection.exec("INSERT INTO answers (category, value, answer, question) VALUES ($1, $2, $3, $4);", [category, value, answer, question])
    end

    def get_answers
      answers = { }
      @connection.exec("SELECT * FROM answers;").each do |row|
        answers[row["answer"]] = row["question"]
      end
      answers
    end
  end
end
