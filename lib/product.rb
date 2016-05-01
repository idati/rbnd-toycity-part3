class Product

  attr_reader :title,:price,:stock
  
  @@products = []
  @@products_stock_more_zero=[]
  
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
  
    add_to_product
  end
  

  def reduce_stock
      @stock -=1
  end

  
  def find_item
    @@products.any?{|item| item.title == @title}
 
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
  
 
    def self.in_stock
    @@products_stock_more_zero = @@products.select{|item| item.in_stock?}                         
  end

  
  def self.all
    @@products
  end
  
  
  private
  def add_to_product
    if !find_item
        @@products << self
    else
      raise DuplicateProductError, "#{@title} already exists."
    end 
  end
  
end