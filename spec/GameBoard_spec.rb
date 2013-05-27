require_relative "../lib/jepar-b/game_board.rb"
require_relative "../lib/jepar-b/answer.rb"

describe JeparB::GameBoard do
  let(:board) {JeparB::GameBoard.new}

  it "should return an array of existing categories" do
    expect(board.list_categories).to be_an_instance_of(Array)
  end

  it "can add a category to the board" do
    board.add_category("category_name")
    expect(board.list_categories).to include("category_name")
  end    
  
  it "creates a hash for each category" do
    board.add_category("category_name")
    expect(board["category_name"]).to be_an_instance_of(Hash)
  end

  it "can add an answer to a category" do
    answer = JeparB::Answer.new("answer", "what is?")
    board.add_category("category_name")
    board.add_answer("category_name", "200", answer)
    p board["category_name"]
    expect(board["category_name"]["200"]).to be_an_instance_of(JeparB::Answer)
  end

end
