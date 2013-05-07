require_relative "../lib/jepar-b/answer"

describe JeparB::Answer do

  let(:answer) {JeparB::Answer.new("answer", "question")}

  it "should return the answer" do
    expect(answer.show_answer).to eq("answer")
  end

  it "should return the question" do
    expect(answer.show_question).to eq("question")
  end
end
