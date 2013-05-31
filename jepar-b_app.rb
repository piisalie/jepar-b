require "sinatra"
require_relative "lib/jepar-b"

enable :sessions

helpers do
  def refresh_board
    session.clear
    session[:board] = JeparB.setup_board
  end
end

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

get("/reset") {
  session.clear
  redirect to('/')
}

get("/admin") {
  @existing_categories = session[:board].list_categories
  erb :admin
}

post("/add_question") {
  db = JeparB::DBManager.new("jeparb_test")
  db.add(params[:category], params[:value], params[:answer], params[:question])
  refresh_board
  redirect to("/admin")
}
