require_relative "../lib/jepar-b/board"

describe JeparB::Board do

  let(:board) { JeparB::Board.new }

  it "returns a list of categories" do
    categories = %w[ cat1 cat2 cat3 ]
    categories.each { |category| board.add_category(category) }
    expect(board.get_categories.last).to eq(categories.last)
  end

  it "can add categories to a list" do
    board.add_category("Methods")
    expect(board.get_categories).to include("Methods")
  end

  it "can remove categories" do
    board.add_category("Methods")
    board.remove_category("Methods")
    expect(board.get_categories.include?("Methods")).to be_false
  end

  it "limits number of categories to six" do
    categories = %w[ cat1 cat2 cat3 cat4 cat5 cat6 ]
    categories.each { |category| board.add_category(category) }
    expect{ board.add_category("cat7")}.to raise_error(RuntimeError, "Board already has six categories")
  end
end
