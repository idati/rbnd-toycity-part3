require_relative "customer"
require_relative "product"
class Transaction < Customer;Product
  attr_reader :customer,:product,:id
  @@transaction=[]
  @@all_id=0
  def initialize(customer, product)
    @customer = customer
    @product = product
    @id=increase_id
    add_transaction
    reduce_stock
  end
  
  def bring_return
    @@transaction.delete_at(self.id-1)
  end
  
  def all
    @@transaction
  end
  
  private 
  def add_transaction
    @@transaction << self
  end
  
  def self.find(id_number)
    @@transaction.each {|x| if x.id == id_number
                              return x
                            end}
  end
 
  
  private
  def reduce_stock
    #puts Product.all.inspect
    #puts Customer.all.inspect
    @product.reduce_stock
  end
  
  def self.all
    @@transaction
  end
  
  private
  def increase_id
    @@all_id+=1
  end
end
