require_relative "jepar-b/answer"
require_relative "jepar-b/category"
require_relative "jepar-b/db_manager"

module JeparB
  def self.get_categories
    @categories = [ ]
    @db         = DBManager.new("jeparb_test")
    @db.get_categories do |category|
      @categories << category
    end
    @categories
  end
end

