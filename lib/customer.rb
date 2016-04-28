require_relative "product"

class Customer < Product
  
  def initialize(options={})
    @title = options[:name]
    #@price = options[:price]
    #@stock = options[:stock]
    
    if !find_item
      add_to_product
    else
      raise DuplicateProductError, "#{@title} already exists."
    end
  end
  
  def self.find_by_name(name)
    self.find_by_title(name)
  end
  
  def self.all
    tmp=[]
    @@products.each{|x| if x.class==Customer
                        tmp<<x
      end}
    return tmp
  end
  
  def purchase(product_item)
    Transaction.new(self,product_item)
  end
  
  def name
    @title
  end


end