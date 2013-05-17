require "sinatra"
require_relative "lib/jepar-b"

get("/") {
  erb :main
}

get("/admin") {
  erb :admin
}

post("/add_question") {
  db = JeparB::DBManager.new("jeparb_test")
  db.add(params[:category], params[:value], params[:answer], params[:question])
  redirect to("/admin")
}
