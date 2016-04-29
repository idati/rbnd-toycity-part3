
class Customer 
  
  attr_reader :name
  
  @@customer = []
  
  def initialize(options={})
    @name = options[:name]
    
    if !find_item
      add_to_customer
    else
      raise DuplicateCustomerError, "#{@name} already exists."
    end
  end
    
    def self.find_by_name(name)
    @@customer.each {|x| if x.name == name
                            return x
                         end}
    raise FindByNameCustomerError, "#{name} can't find in Customer List"
  end
  
  def find_item
    @@customer.each{|x| if x.name==@name
                        return true
                      end}
  return false
  end
  
  def self.all
    @@customer
  end
  
  def purchase(product_item)
    if product_item.stock > 0
      Transaction.new(self,product_item)
    else
      raise OutOfStockError, "Transaction error for product#{product_item.title}, reason: number of stock: #{product_item.stock}"
    end
  end
  
  private
  def add_to_customer
        @@customer << self
  end

end