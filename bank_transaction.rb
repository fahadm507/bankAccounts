require 'pry'

class BankTransaction
  attr_reader :amount, :date, :description, :account
  def initialize(csv_row)
    @amount = csv_row[:amount]
    @date = csv_row[:date]
    @description= csv_row[:description]
    @account = csv_row[:account]

  def deposit?
    amount > 0
  end

  def summary
    deposit? type="DEPOSIT": "WITHDRAWAL"
    "#{amount}  #{type}   #{date} - #{description}"
  end

end









