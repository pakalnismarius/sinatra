require './customer'
require './customer_generator'
require 'pg'

$pg = PGconn.connect("localhost", 5432, '', '', "new_customers", "postgres")

# 3.times do
# customer = CustomerGenerator.generate_customer
# customer.create
# end