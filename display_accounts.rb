require 'pry'
require_relative 'Bank_account'

puts "==== Purchasing Account ===="

bank = BankAccount.new('Purchasing Account')
bank2 = BankAccount.new('Business Checking')

puts "Starting Balance: $#{bank.balance}"
puts "Ending Balance: $#{bank.current_balance}"
bank.summary.each do |x|
  puts "$#{x.amount} #{x.deposit?} #{x.date} - #{x.description}"
end

puts "========"
puts

puts "==== Business Checking ===="

puts "Starting Balance: $#{bank2.balance}"
puts "Ending Balance: $#{bank2.current_balance}"
bank2.summary.each do |x|
  puts "$#{x.amount} #{x.deposit?} #{x.date} - #{x.description}"
end
puts "========"




