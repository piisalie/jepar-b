require 'pg'

module JeparB
  class DBManager
    def initialize(name)
      @connection = PG.connect(dbname: name)
    end
    attr_accessor :connection

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

    def get_categories
      @connection.exec("SELECT LOWER(category) FROM answers GROUP BY LOWER(category);").each do |row|
        yield row["lower"]
      end
    end

    def get_answers_from_category(category_name)
      @connection.exec("SELECT value, answer, question FROM answers WHERE LOWER(category) = LOWER($1);", [category_name]).each do |answer|
        yield answer
      end
    end
  end
end
