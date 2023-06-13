require './Chapter1/lib/movie.rb'
require './Chapter1/lib/rental.rb'
require './Chapter1/lib/regular_price.rb'

RSpec.describe Rental do
  let(:movie) { Movie.new('Avatar', RegularPrice.new) }
  let(:days_rented) { 7 }
  subject { Rental.new(movie, days_rented) }

  describe "#initialize" do
    it { expect(subject.movie).to eq movie }
    it { expect(subject.days_rented).to eq days_rented }
  end
end
