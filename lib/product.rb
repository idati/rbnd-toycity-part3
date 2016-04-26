# product.rb

class Product
  attr_reader :title,:price,:stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
 
    if !find_item
      add_to_product
    else
      raise DuplicateProductError, "#{@title} already exists."
    end
 
  end

  def find_item
  @@products.each{|x| if x.title==@title
                        return true
                      end}
  return false
  end
  
  #def in_stock
  #  if 
  #end
  
  #def find_by_title
  #  
  #end
  
  def self.all
    @@products
  end
  
  private
  def add_to_product
        @@products << self
  end
end