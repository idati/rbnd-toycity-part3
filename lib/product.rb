# product.rb

class Product
  attr_reader :title,:price,:stock
  @@products = []
  @@run_first_customer=true
  @@products_stock_more_zero=[]
  
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
  
  def reduce_stock
    @stock -=1
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
  
  def transacion_done
    puts "try this"
    if find_item
      
    end
#    @@products_stock_more_zero.each {|x| if x.title == title
#                                            puts x.stock
#                                         end}
#  Product.in_stock
  end
  
  def self.in_stock
    @@products_stock_more_zero=[]
    @@products.each {|x| if x.in_stock?
                         @@products_stock_more_zero << x
                         end}
             
    return @@products_stock_more_zero
                         
  end
  
  def include?(item)
    @@products_stock_more_zero.each {|x| if x == item
                                            return true
                                          else
                                            return false
                                          end
                                            }
  end
  
  def self.all
    tmp=[]
    @@products.each{|x| if x.class==Product
                        tmp<<x
      end}
    return tmp
  end
  
  private
  def add_to_product
        @@products << self
  end
  
end