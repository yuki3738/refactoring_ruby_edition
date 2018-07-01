require './lib/movie.rb'

RSpec.describe Movie do
  let(:title) { "Avatar" }
  let(:price_code) { Movie::REGULAR }
  subject { Movie.new(title, price_code) }

  describe "#initialize" do
    it { expect(subject.title).to eq title }
    it { expect(subject.price_code).to eq price_code }
  end
end
