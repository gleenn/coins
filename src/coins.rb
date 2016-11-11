class Coins
  attr_reader :coinset, :amount

  def initialize(coinset, amount)
    @coinset = coinset.sort.reverse
    @amount = amount
  end

  def solve
    full_result = (0..coinset.size).inject(nil) do |result, coin_index|
      result || recurse(coin_index, Hash.new(0), amount)
    end
    full_result || raise("No possible solution")
  end

  private

  def recurse(coin_index, coinbag, amount_remaining)
    current_coin = coinset[coin_index]
    return unless current_coin
    # puts "#{current_coin} #{coinbag} #{amount_remaining}"
    result = if amount_remaining - current_coin == 0
      coinbag[current_coin] += 1
      coinbag
    elsif amount_remaining - current_coin < 0
      recurse(coin_index + 1, coinbag, amount_remaining)
    else
      coinbag[current_coin] += 1
      recurse(coin_index, coinbag, amount_remaining - current_coin)
    end
    if result&.inject(0) {|sum, (coin, count)| sum + (coin * count)} == amount
      result
    else
      nil
    end
  end
end