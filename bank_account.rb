require 'csv'

class BankAccount
  @bank_trans = []#bank transactions
  def initialize()
  end

  def starting_balance
    balances = []
    CSV.foreach('balances.csv', headers: true) do |row|
      balances << row
    end
    balances
    binding.pry
  end

  def current_balance
  end

  def summary
  end
end

account = BankAccount.new
account.starting_balance



