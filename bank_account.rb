require 'csv'
require 'pry'

class BankAccount

attr_reader :account_name, :starting_balance

  def initialize(account_name, starting_balance)
    @account_name = account_name
    @starting_balance = starting_balance.to_f
  end

  def self.all
    @accounts = []
    CSV.foreach('balances.csv', headers: true) do |row|
      account = { account_name: row["Account"], starting_balance: row["Balance"] }

      @accounts << BankAccount.new(account[:account_name], account[:starting_balance])
    end
    @accounts
  end


  def summary
    summary_array = []
    transactions = BankTransaction.all
    transactions.each do |transaction|
        if transaction.account == @account_name
          summary_array << transaction.summary
        end
    end
    summary_array
  end


  def current_balance
    balance = @starting_balance
    transactions = BankTransaction.all
    transactions.each do |transaction|
      if transaction.account == @account_name
        balance += transaction.amount
      end
    end
    balance
  end

end










