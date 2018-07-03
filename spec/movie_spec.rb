require './lib/movie.rb'
require 'pry-byebug'

RSpec.describe Movie do
  let(:title) { "Avatar" }
  let(:regular_price) { RegularPrice.new }
  let(:movie) { Movie.new(title, RegularPrice.new) }

  describe "#initialize" do
    it { expect(movie.title).to eq title }
    it do
      movie.price = regular_price
      expect(movie.price).to eq regular_price
    end
  end
end
