class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "products.json.jbuilder"
  end

  def sweet_trudys_method
    @sweet_trudys = Product.first
    render "sweet_trudys.json.jbuilder"
  end
end
