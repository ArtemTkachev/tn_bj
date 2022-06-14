# frozen_string_literal: true

# class Account
class Account
  attr_reader :total_amount

  def initialize(total_amount)
    @total_amount = total_amount
  end

  def enough_funds?(amount)
    total_amount >= amount
  end

  def withdraw(amount)
    raise 'There are no more funds in the account!' if amount > total_amount

    @total_amount -= amount
  end

  def top_up(amount)
    @total_amount += amount
  end
end
