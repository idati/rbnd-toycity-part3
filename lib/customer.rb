require_relative "product"
class Customer < Product
  
  def initialize(options={})
    @title = options[:name]
    #@price = options[:price]
    #@stock = options[:stock]
    
    if @@run_first_customer==true
      run_first_time
    end
    
    if !find_item
      add_to_product
    else
      raise DuplicateProductError, "#{@title} already exists."
    end
  end
  
  def self.find_by_name(name)
    self.find_by_title(name)
  end
  
  def name
    @title
  end

end