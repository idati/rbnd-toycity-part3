
class Customer 
  
  attr_reader :name
  
  @@customer = []
  
  def initialize(options)
    @name = options[:name]
      add_to_customer
  end
    
    def self.find_by_name(name)
    @@customer.each {|customer| if customer.name == name
                            return customer
                         end}
    raise FindByNameCustomerError, "#{name} can't find in Customer List"
  end
  
  def find_customer
    @@customer.each{|customer| if customer.name==@name
                        return true
                      end}
  return false
  end
  
  def self.all
    @@customer
  end
  
  def purchase(product_item)
      Transaction.new(self,product_item)
  end
  
  private
  def add_to_customer
    if !find_customer
        @@customer << self
    else
      raise DuplicateCustomerError, "#{@name} already exists."
    end
  end

end