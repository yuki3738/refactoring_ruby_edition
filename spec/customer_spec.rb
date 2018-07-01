require './lib/movie.rb'
require './lib/rental.rb'
require './lib/customer.rb'
require './lib/childrens_price.rb'
require './lib/new_release_price.rb'
require './lib/regular_price.rb'

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

  describe "#html_statement" do
    before do
      subject.add_rental(rental)
    end

    context 'when rented rsegular movie' do
      let(:html_statement) { "<h1>Rentals for <em>#{name}</em></h1><p>\n\t#{movie.title}: 9.5<br>\n<p>You owed <em>9.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>" }

      it { expect(subject.html_statement).to eq html_statement }
    end

    context 'when rented new movie' do
      let(:movie) { Movie.new('New Movie', Movie::NEW_RELEASE) }
      let(:html_statement) { "<h1>Rentals for <em>#{name}</em></h1><p>\n\t#{movie.title}: 21<br>\n<p>You owed <em>21</em><p>\nOn this rental you earned <em>2</em> frequent renter points<p>" }

      it { expect(subject.html_statement).to eq html_statement }
    end

    context 'when rented childrens movie' do
      let(:movie) { Movie.new('Childrens Movie', Movie::CHILDRENS) }
      let(:html_statement) { "<h1>Rentals for <em>#{name}</em></h1><p>\n\t#{movie.title}: 7.5<br>\n<p>You owed <em>7.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>" }

      it { expect(subject.html_statement).to eq html_statement }
    end
  end
end
