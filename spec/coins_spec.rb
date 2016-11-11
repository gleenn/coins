require 'rspec'
require_relative '../src/coins'

describe Coins do
  describe '#solve' do
    it 'returns a hash mapping the coins to the quantity' do
      expect(Coins.new([1, 2, 4], 15).solve).to eq({4 => 3, 2 => 1, 1 => 1})
      expect(Coins.new([2, 3], 4).solve).to eq({2 => 2})
      expect(Coins.new([1, 5, 10, 25], 89).solve).to eq({25=>3, 10=>1, 1=>4})
      expect(Coins.new([10, 13, 25], 80).solve).to eq({10=>8})

      expect { Coins.new([2, 4], 9).solve }.to raise_error('No possible solution')
      expect { Coins.new([10], 1).solve }.to raise_error('No possible solution')
      expect { Coins.new([], 1).solve }.to raise_error('No possible solution')
    end
  end
end