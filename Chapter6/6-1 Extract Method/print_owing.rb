# frozen_string_literal: true

class Customer
  attr_accessor :name, :orders

  def initialize(name)
    @name = name
    @orders = []
  end

  def print_owing
    outstanding = 0.0
    # print banner
    puts "*************************"
    puts "***** Customer Owes *****"
    puts "*************************"
    # calculate outstanding
    @orders.each do |order|
      outstanding += order.amount
    end
    # print details
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end
end

class Order
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end
end
