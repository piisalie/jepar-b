module JeparB
  class Board
    def initialize
      @categories = [ ]
    end

    def add_category(category)
      fail "Board already has six categories" if @categories.size == 6
      @categories << category
    end

    def get_categories
      @categories
    end

    def remove_category(category)
      @categories.delete(category)
    end
  end
end
