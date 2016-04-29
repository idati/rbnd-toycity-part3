
class Transaction 
  
  attr_reader :customer,:product,:id
  
  @@transaction=[]  
  @@all_id=0

  def initialize(customer, product)
    @customer = customer
    @product = product
    if @product.stock > 0
      @id=increase_id   #@id_all+1
      add_transaction   #add transaction
      reduce_stock      #reduce stock
    else
      raise OutOfStockError, "Transaction error for product#{product.title}, reason: number of stock: #{product.stock}"
    end
  end
  
  def bring_return
    @@transaction.delete_at(self.id-1)
    reduce_id
  end
  
  def all
    @@transaction
  end
  
  def self.find_all_bought_products_from_customer(customer)
    @@transaction.each{|x| if x.customer.name==customer
                           puts x.product.title 
                           end}
  end
  
  def self.find(id_number)
    @@transaction.each {|x| if x.id == id_number
                              return x
                            end}
  end
   def self.all
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
 
  private
  def increase_id
    @@all_id+=1
  end
  
  private 
  def reduce_id
    @@all_id-=1
  end
  
end
