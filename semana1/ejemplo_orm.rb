class Product < ApplicationRecord
  self.products = "my_products"
end	

CREATE TABLE products (
  id INTEGER PRIMERY KEY AUTOINCRMENT,
  name VARCHAR(64) NOT NULL
);




p = Product.new
p.name = "some book"
puts p.name

