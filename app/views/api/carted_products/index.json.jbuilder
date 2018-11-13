
json.current_user current_user.id
json.carted_products @carted_products.each do |carted_product|
  json.quantity carted_product.quantity
  json.product carted_product.product
end

