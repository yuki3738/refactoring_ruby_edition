require './lib/movie.rb'
require './lib/rental.rb'
require './lib/customer.rb'

RSpec.describe Customer do
  let(:name) { 'Bob' }
  let(:movie) { Movie.new('Avatar', Movie::REGULAR) }
  let(:days_rented) { 7 }
  let(:rental) { Rental.new(movie, days_rented) }
  subject { Customer.new(name) }

  describe "#initialize" do
    it { expect(subject.name).to eq name }
  end

  describe "#add_rental" do
    it { expect(subject.add_rental(rental)).to include rental }
  end

  describe "#statement" do
    before do
      subject.add_rental(rental)
    end

    context 'when rented rsegular movie' do
      let(:statement) { "Rental Record for #{name}\n\t#{movie.title}\t9.5\nAmount owed is 9.5\nYou earned 1 frequent renter points" }

      it { expect(subject.statement).to eq statement }
    end

    context 'when rented new movie' do
      let(:movie) { Movie.new('New Movie', Movie::NEW_RELEASE) }
      let(:statement) { "Rental Record for #{name}\n\t#{movie.title}\t21\nAmount owed is 21\nYou earned 2 frequent renter points" }

      it { expect(subject.statement).to eq statement }
    end

    context 'when rented childrens movie' do
      let(:movie) { Movie.new('Childrens Movie', Movie::CHILDRENS) }
      let(:statement) { "Rental Record for #{name}\n\t#{movie.title}\t7.5\nAmount owed is 7.5\nYou earned 1 frequent renter points" }

      it { expect(subject.statement).to eq statement }
    end
  end
end
