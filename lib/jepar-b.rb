require_relative "jepar-b/answer"
require_relative "jepar-b/db_manager"
require_relative "jepar-b/game_board"

module JeparB

  def self.setup_board
    setup_db
    @board = GameBoard.new

    @db.get_categories do |category|
      @board.add_category(category)
    end

    @board.list_categories.each do |category_name|
      @db.get_answers_from_category(category_name) do |answer|
        @board.add_answer(category_name, answer["value"], Answer.new(answer["answer"], answer["question"]))
      end
    end
    p @board
  end

  def self.get_categories
    setup_db
    @categories = [ ]
    @db.get_categories do |category|
      @categories << category
    end
    @categories
  end

  def self.get_answer(category, value)
    setup_db
    @db.find_answer(category, value) do |result|
      return result["answer"]
    end
  end

  def self.get_question(category, value)
    setup_db
    @db.find_question(category, value) do |result|
      return result["question"]
    end
  end

  private

  def self.setup_db
    @db = DBManager.new("jeparb_test")
  end
end
