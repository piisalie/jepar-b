require 'pg'
require_relative "lib/jepar-b/db_manager"

system("dropdb jeparb_test")
system("createdb jeparb_test")

@db = JeparB::DBManager.new("jeparb_test")

@db.connection.exec("CREATE TABLE answers (category VARCHAR, value VARCHAR, question VARCHAR, answer VARCHAR);")

@db.add("fruit", "200", "It is red and sometimes crisp.", "What is an apple?")
@db.add("fruit", "400", "Brightly colored and a kind of tart.", "What is an orange?")
@db.add("dinner", "200", "It's what's for dinner", "beef")
@db.add("Dinner", "400", "The other white meat", "pork")

@db.get_categories do |category|
  puts category
end

