require "sinatra"
require_relative "lib/jepar-b"

enable :sessions

get("/") {
  @board = session[:board] ||= JeparB.setup_board
  erb :index
}

get("/answer/:category/:value") {
  @category = params[:category]
  @value    = params[:value]
  @answer   = session[:board][@category][@value].show_answer
  erb :answer
}

get("/question/:category/:value") {
  @category = params[:category]
  @value    = params[:value]
  @question = session[:board][@category][@value].show_question
  session[:board].remove_answer(@category, @value)
  erb :question
}

get("/clear") {
  session.clear
  redirect to('/')
}

get("/admin") {
  erb :admin
}

post("/add_question") {
  db = JeparB::DBManager.new("jeparb_test")
  db.add(params[:category], params[:value], params[:answer], params[:question])
  redirect to("/admin")
}
