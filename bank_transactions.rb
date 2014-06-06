require 'csv'
require 'pry'

class BankTransaction
attr_reader :date, :amount, :description, :account
  def initialize(date, amount, description, account)
    @date = date
    @amount = amount
    @description = description
    @account = account
  end

  def self.all(csv)
    transactions = []
    CSV.foreach(csv, headers: true) do |row|
      transaction = { date: row["Date"], amount: row["Amount"], description: row["Description"], account: row["Account"] }

      transactions << BankTransaction.new(transaction[:date], transaction[:amount], transaction[:description], transaction[:account])
    end
    binding.pry
  end
  end

  BankTransaction.all('bank_data.csv')
