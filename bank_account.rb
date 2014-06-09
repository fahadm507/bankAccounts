require 'csv'
require 'pry'

class BankAccount
  attr_reader :account, :balance
  def initialize(account)
    CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
        if row[:account] == account
          @account = row[:account]
          @balance = row[:balance].to_i
        end
    end

    @transactions = []
    @ending_balance = []
    CSV.foreach('bank_data.csv', headers: true, header_converters: :symbol) do |row|

      if row[:account] == account
        @ending_balance << row[:amount].to_i
        @transactions << row.to_hash
      end
    end
  end

  def starting_balance
    @balance
  end

  def current_balance
    @ending_balance.each do |trans|
      @balance += trans
    end
    @balance
  end

  def summary
    total_trans=[]
    @transactions.each do |trans|
      total_trans << BankTransaction.new(trans)
    end
    total_trans
  end

end

class BankTransaction

  attr_reader :date, :amount, :description, :account
  def initialize(account)
    @date = account[:date]
    @amount = account[:amount].to_i
    @description = account[:description]
    @account = account[:account]
  end
  def deposit?
    if amount > 0
      "DEPOSIT"
    else
      "WITHDRAWAL"
    end
  end

  def summary

  end

end












