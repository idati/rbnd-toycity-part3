class Product

  attr_reader :title,:price,:stock
  
  @@products = []
  @@products_stock_more_zero=[]
  
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
  
    if !find_item
      add_to_product
    end 
  end
  

  def reduce_stock
    if @stock > 0
      @stock -=1
    else 
      raise OutOfStockError, "Transaction error for product#{@title}, reason: number of stock: #{@stock}"
    end
  end

  
  def find_item
  @@products.each{|x| if x.title==@title
                        return true
                      end}
  return false
  end
  
  def self.find_by_title(title)
    @@products.each {|x| if x.title == title
                            return x
                         end}
    raise FindByTitleProductError, "#{title} can't find in Product List"
  end
  
  
  def in_stock?
    @stock > 0
  end
  
  
  def include?(item)
    @@products_stock_more_zero.find{|array_item| array_item==item}
  end


    def self.in_stock
    @@products_stock_more_zero = @@products.select{|x| x.in_stock?}
    return @@products_stock_more_zero
                         
  end

  
  def self.all
    @@products
  end
  
  
  private
  def add_to_product
        @@products << self
  end
  
end