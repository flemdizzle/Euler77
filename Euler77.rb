require 'minitest/autorun'
require 'prime'
# number of combinations >= 5000

class Euler

  def all_primes_under(num) #returns array of primes < given num
    primeArray = []
    Prime.each(num) do |prime|
      primeArray << prime
    end
    return primeArray
  end

  def array_sum(array) #array sum calculator
    array.inject{|sum, num| sum += num}
  end

# # returns all primes combinations with a sum equal to num
# uses repeated_comb to generate arrays with 1 to primeCount worth of primes
# checks for combinations with sum equal to num and finally spits out tot num of combos
  def prime_sums_equal_num(num) 
    count = 0
    (1..num/2).each do |primeCount| 
      all_primes_under(num).repeated_combination(primeCount).each do |sums|
        if array_sum(sums) == num
          count += 1
        end
      end
    end
    count
  end

end

class Test < MiniTest::Unit::TestCase
  def setup
    @euler = Euler.new
  end

  def test_all_primes_under
    assert_equal([2, 3, 5, 7, 11, 13, 17, 19, 23, 29], @euler.all_primes_under(30))
  end

  def test_array_sum
    assert_equal(25, @euler.array_sum([5,5,5,5,5]))
    assert_equal(15, @euler.array_sum([1,2,3,4,5]))
  end

  def test_prime_sums_equal_num
    assert_equal(2,@euler.prime_sums_equal_num(5))
    assert_equal(2,@euler.prime_sums_equal_num(6))
  end

end
