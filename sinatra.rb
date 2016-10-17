require 'sinatra/base'
require './customer'
require './customer_generator'
require 'pg'
require 'pry'
require 'pry-nav'
require './main'

class ManoApp < Sinatra::Base
	get '/' do
		@per_page = 10
		@page = params['page'].to_i 
		@customers = Customer.all(@per_page, @page)
		@last_page = Customer.count / @per_page
		#binding.pry
		erb :main
	end

	get '/customers/:id' do
	    @customer = Customer.find(params[:id])
	    erb :customers
  	end

  	get '/customers/:id/edit' do
  		 @customer = Customer.find(params[:id])
  		 erb :edit
  	end

  	post '/customers' do
  		@customer = Customer.find(params[:id])
  		@customer.update(params)
  		redirect "customers/#{params[:id]}"
  	end

  	get '/lentele' do
  		erb :lentele
  	end

	def pg
		PGconn.connect("localhost", 5432, '', '', "new_customers", "postgres")
	end
end
ManoApp.run!