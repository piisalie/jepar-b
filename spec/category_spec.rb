require_relative "../lib/jepar-b/category"

describe JeparB::Category do

  let(:category) {JeparB::Category.new("category name")}
  
  it "has a name" do
    expect(category.name).to eq("category name")
  end

  it "can add and store answers keyed by value" do
    category.add_answer("some answer", "value")
    expect(category.answers["value"]).to eq("some answer")
  end

  it "can remove answers" do
    category.add_answer("some answer", "value")
    category.remove_answer("value")
    expect(category.answers["value"]).to be_nil
  end

  it "can list answers" do
    category.add_answer("some answer", "200")
    category.add_answer("another answer", "400")
    expect { |b| category.list_answers(&b) }.to yield_successive_args(["some answer", "200"],["another answer", "400"]) 
  end
end
