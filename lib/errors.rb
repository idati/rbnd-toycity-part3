# lib/errors.rb

class DuplicateProductError < StandardError
  
end
class DuplicateCustomerError < StandardError
  
end

class FindByTitleProductError < StandardError
  
end

class FindByNameCustomerError < StandardError
  
end

class OutOfStockError < StandardError
  
end