require_relative "../lib/jepar-b/game_board.rb"
require_relative "../lib/jepar-b/answer.rb"

describe JeparB::GameBoard do
  let(:board)  {JeparB::GameBoard.new}
  let(:answer) {JeparB::Answer.new("love, life, the universe and everything", "what is the question?")}

  it "should return an array of existing categories" do
    expect(board.list_categories).to be_an_instance_of(Array)
  end

  it "can add a category to the board" do
    board.add_category("category_name")
    expect(board.list_categories).to include("category_name")
  end

  it "can access each category with bracket notation" do
    board.add_category("category_name")
    expect(board["category_name"]).to be_true
  end
  
  it "creates a hash for each category" do
    board.add_category("category_name")
    expect(board["category_name"]).to be_an_instance_of(Hash)
  end

  it "can add an answer to a category" do
    board.add_category("category_name")
    board.add_answer("category_name", "200", answer)
    expect(board["category_name"]["200"]).to be_an_instance_of(JeparB::Answer)
  end

  it "can remove an answer from a category" do
    board.add_category("category_name")
    board.add_answer("category_name", "200", answer)
    board.remove_answer("category_name", "200")
    expect(board["category_name"]["200"]).to be_nil
  end

end
