#!/usr/bin/env ruby

require_relative '../lib/belir.rb'
require 'test/unit'

class TestBelir < Test::Unit::TestCase
  def test_new_eqn
    eq = Belir::Equation.new(:x, :y) { |y| y * 2 }
    assert_equal(eq.calculate(2), 4)
    eq = Belir::Equation.new(:x, :y, :z) { |y, z| y + z }
    assert_equal(eq.calculate(2, 3), 5)
  end
end
