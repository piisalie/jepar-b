module JeparB
  class GameBoard
    def initialize
      @categories = { }
    end

    def list_categories
      @categories.keys
    end

    def add_category(category_name)
      @categories[category_name] = { }
    end

    def [](category_name)
      @categories[category_name]
    end

    def add_answer(category_name, value, answer)
      @categories[category_name][value] = answer
    end

    def remove_answer(category_name, value)
      @categories[category_name].delete(value)
    end

  end
end
