# frozen_string_literal: true

class Customer
  attr_accessor :name, :orders

  def initialize(name)
    @name = name
    @orders = []
  end

  def print_owing
    print_banner

    outstanding = calculate_outstanding

    print_details(outstanding)
  end

  def print_banner
    puts "*************************"
    puts "***** Customer Owes *****"
    puts "*************************"
  end

  def print_details(outstanding)
    puts "name: #{@name}"
    puts "amount: #{outstanding}"
  end

  def calculate_outstanding
    outstanding = 0.0
    @orders.each do |order|
      outstanding += order.amount
    end
    outstanding
  end
end

class Order
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end
end
