require 'pg'

module JeparB
  class DBManager
    def initialize(name)
      @name       = name
      @connection = PG.connect(dbname: @name)
    end
    attr_reader :name, :connection
  end
end
