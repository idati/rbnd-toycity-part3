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
  
  #Question why iam not able to use find_item function in self.find_by_title
  #error: NameError: undefined local variable or method `find_item' for Product:Class
  def self.find_by_title(title)
    @@products.each {|x| if x.title == title
                            return x
                         end}
    
    #if output==0
    raise FindByTitleProductError, "#{title} can't find in Product List"
  end
  
  def in_stock?
    if (@stock == nil) or (@stock == 0)
      return false
    else
      return true
    end 
  end
  
  
  def self.all
    @@products
  end
  
  private
  def add_to_product
        @@products << self
  end
end