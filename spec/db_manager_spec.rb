require_relative "../lib/jepar-b/db_manager"

describe JeparB::DBManager do
  let(:db)     {JeparB::DBManager.new("jeparb_test")}

  it "can connect to a database of a given name" do
    expect(db.connection).to be_an_instance_of(PG::Connection)
  end

  it "can return all of the answers saved"

  it "can save a answer to the database" do
    category = "test"
    value    = "200"
    answer   = "It's an answer"
    question = "What is a question?"
    db.add(category, value, answer, question)
    expect(db.get_answers).to include("It's an answer")
  end

  it "can return a list of categories"

  it "can return all of the answers in a given category"

end

