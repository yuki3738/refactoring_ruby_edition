require './lib/movie.rb'
require './lib/rental.rb'

RSpec.describe Rental do
  let(:movie) { Movie.new('Avatar', Movie::REGULAR) }
  let(:days_rented) { 7 }
  subject { Rental.new(movie, days_rented) }

  describe "#initialize" do
    it { expect(subject.movie).to eq movie }
    it { expect(subject.days_rented).to eq days_rented }
  end
end
