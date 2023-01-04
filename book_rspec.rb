require './Book'
require './rental'

describe Book do
 context "testing book" do
  it 'Testing initialize method title'  do
    books = Book.new("alfa", 'omega')
    expect(books.title).to eq "alfa"
  end

  it 'Testing initialize method book'  do
    books = Book.new("alfa", "omega")
    expect(books.author).to eq "omega"
  end

  it
end
end
