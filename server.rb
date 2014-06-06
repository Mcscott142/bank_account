require 'sinatra'
require 'csv'
require 'pry'
require_relative 'bank_account'
require_relative 'bank_transactions'

get '/accounts' do
  @accounts = BankAccount.all

  erb :'accounts/index'
end


get '/accounts/personal+checking' do

  erb :'accounts/show'
end



