require'./rental'

describe Rental do
  context "testing rental" do
   it 'Testing initialize method rental'  do
     rental = Rental.new("2022-01-04", "didier","alfa")
     expect(rental.book).to eq "alfa"
   end
  end
end
