# frozen_string_literal: true

require 'test/unit'
require_relative 'print_owing'
require 'stringio'

class TestCustomer < Test::Unit::TestCase
  def setup
    @customer = Customer.new('TestCustomer')
    @customer.orders = [Order.new(5.0), Order.new(15.0)]
  end

  def test_print_owing
    expected_output = <<~HEREDOC
      *************************
      ***** Customer Owes *****
      *************************
      name: TestCustomer
      amount: 20.0
    HEREDOC

    stdout = StringIO.new
    $stdout = stdout
    @customer.print_owing
    $stdout = STDOUT

    assert_equal(expected_output, stdout.string)
  end
end
