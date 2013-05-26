require_relative "jepar-b/answer"
require_relative "jepar-b/category"
require_relative "jepar-b/db_manager"

module JeparB
  def self.get_categories
    setup_db("jeparb_test")
    @categories = [ ]
    @db.get_categories do |category|
      @categories << category
    end
    @categories
  end

  def self.get_answer(category, value)
    setup_db("jeparb_test")
    @db.find_answer(category, value) do |result|
      return result["answer"]
    end
  end

  def self.get_question(category, value)
    setup_db("jeparb_test")
    @db.find_question(category, value) do |result|
      return result["question"]
    end
  end

  private

  def self.setup_db(name)
    @db = DBManager.new(name)
  end
end
