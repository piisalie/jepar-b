require_relative "../lib/jepar-b/db_manager"

describe JeparB::DBManager do
  let(:db) {JeparB::DBManager.new("jeparb_test")}
  
  it "can connect to a database of a given name" do
    expect(db.connection).to be_an_instance_of(PG::Connection)
  end

  it "can save a question to the database"

  it "can setup required tables"

  it "can return a list of categories"

  it "can return all of the questions in a given category"

end
