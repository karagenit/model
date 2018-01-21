#!/usr/bin/env ruby

require_relative '../lib/belir.rb'
require 'test/unit'

class TestBelir < Test::Unit::TestCase
  def test_eqn_one
    eq = Belir::Equation.new(:x, :y) { |y| y * 2 }
    assert_equal(eq.calculate(2), 4)
    # assert_raise(ArgumentError) { eq.calculate(2, 2) }
  end

  def test_eqn_two
    eq = Belir::Equation.new(:x, :y, :z) { |y, z| y + z }
    assert_equal(eq.calculate(2, 3), 5)
    # assert_raise(ArgumentError) { eq.calculate(2) }
  end
end
