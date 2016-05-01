
class Transaction 
  
  attr_reader :customer,:product,:id
  
  @@transaction=[]  
  @@all_id=0

  def initialize(customer, product)
    @customer = customer
    @product = product
    if check_stock 
      @id=increase_id
      add_transaction
      reduce_stock
    end

  end
  
  def check_stock
    if @product.stock > 0
    else
      raise OutOfStockError, "Transaction error for product: #{product.title}, reason: number of stock: #{product.stock}"
    end
    return true
  end
  
  def bring_return
    @@transaction.delete_at(find_index(self.id))
    #delete this function to count all transaction, so each transaction is unique also when item returns
    #reduce_id
  end
  
  def all
    @@transaction
  end
  
  def self.find_all_bought_products_from_customer(customer)
    @@transaction.each{|transaction| if transaction.customer.name==customer
                           puts transaction.product.title 
                           end}
  end
  
  def self.find(id_number)
#    @@transaction.each {|x| if x.id == id_number
#                              return x
#                            end}
    @@transaction.find{|transaction|transaction.id == id_number}
  end

  def find_index(id_number)
    @@transaction.find_index {|transaction| transaction.id==id_number}
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
  
  
end
