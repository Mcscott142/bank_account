require 'csv'
require 'pry'

class BankTransaction
attr_reader :date, :amount, :description, :account
  def initialize(date, amount, description, account)
    @date = date
    @amount = amount.to_f
    @description = description
    @account = account
  end


  def self.all
    transactions = []
    CSV.foreach('bank_data.csv', headers: true) do |row|
      transaction = { date: row["Date"], amount: row["Amount"], description: row["Description"], account: row["Account"] }

      transactions << BankTransaction.new(transaction[:date], transaction[:amount], transaction[:description], transaction[:account])
    end
    transactions
  end


  def deposit?
    if @amount >= 0
      "DEPOSIT"
    else
      "WITHDRAWAL"
    end
  end

  def summary
    "$#{self.amount.abs}    #{self.deposit?}    #{self.date}    -   #{self.description}"
  end

end



