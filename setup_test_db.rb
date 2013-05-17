require 'pg'
system("dropdb jeparb_test")
system("createdb jeparb_test")

db = PG.connect(dbname: "jeparb_test")

db.exec("CREATE TABLE answers (category VARCHAR, value VARCHAR, question VARCHAR, answer VARCHAR);")



