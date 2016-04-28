require_relative "customer"
require_relative "product"
class Transaction < Customer;Product
  attr_reader :customer,:product,:id
  @@transaction=[]
  @@all_id=[]
  def initialize(customer, product)
    @customer = customer
    @product = product
    @id=1
    add_transaction
    reduce_stock
  end
  
  def all
    @@transaction
  end
  
  private 
  def add_transaction
    @@transaction << self
  end
  
  private
  def reduce_stock
    #puts Product.all.inspect
    #puts Customer.all.inspect
    @product.reduce_stock
  end
end
