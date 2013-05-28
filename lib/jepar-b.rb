require_relative "jepar-b/answer"
require_relative "jepar-b/db_manager"
require_relative "jepar-b/game_board"

module JeparB

  def self.setup_board
    setup_db
    @board = GameBoard.new
    load_categories
    load_answers_into_categories
    @board
  end

  private

  def self.setup_db
    @db = DBManager.new("jeparb_test")
  end

  def self.load_categories
    @db.get_categories do |category|
      @board.add_category(category)
    end
  end

  def self.load_answers_into_categories
    @board.list_categories.each do |category_name|
      @db.get_answers_from_category(category_name) do |answer|
        @board.add_answer(category_name, answer["value"], Answer.new(answer["answer"], answer["question"]))
      end
    end
  end
end
