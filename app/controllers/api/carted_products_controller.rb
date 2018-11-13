class Api::CartedProductsController < ApplicationController
  
  def index
    @carted_products = CartedProduct.where(
      status: "carted",
      user_id: current_user.id
      )
    render "index.json.jbuilder"
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
      user_id: current_user.id
     )
    @carted_product.save

    if @carted_product.save
      render json: {message: "Item successfully added to cart"}
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :bad_request
    end

    #@carted_product = CartedProduct.where("status LIKE ? AND user_id = ?", "%carted%", current_user.id)
  end
end
