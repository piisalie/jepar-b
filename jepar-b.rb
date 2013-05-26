require "sinatra"
require_relative "lib/jepar-b"

get("/") {
  @categories = JeparB.get_categories
  @values     = [ "200", "400", "600", "800", "1000"]
  erb :index
}

get("/answer/:category/:value") {
  @category = params[:category]
  @value    = params[:value]
  @answer   = JeparB.get_answer(@category, @value)
  erb :answer
}

get("/question/:category/:value") {
  @category = params[:category]
  @value    = params[:value]
  @question = JeparB.get_question(@category, @value)
  erb :question
}

get("/admin") {
  erb :admin
}

post("/add_question") {
  db = JeparB::DBManager.new("jeparb_test")
  db.add(params[:category], params[:value], params[:answer], params[:question])
  redirect to("/admin")
}
