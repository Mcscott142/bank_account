require 'csv'
require 'pry'

class BankAccount

attr_reader :account_name, :starting_balance

  def initialize(account_name, starting_balance)
    @account_name = account_name
    @starting_balance = starting_balance
  end

  def self.all(csv)
    accounts = []
    CSV.foreach(csv, headers: true) do |row|
      account = { account_name: row["Account"], starting_balance: row["Balance"] }

      accounts << BankAccount.new(account[:account_name], account[:starting_balance])
    end
  end
end







