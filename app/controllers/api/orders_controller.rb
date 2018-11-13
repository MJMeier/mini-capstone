class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end
  
  def create
    calculated_subtotal = 0
    calculated_tax = 0
    calculated_total = 0

    @order = Order.new(
      quantity: params["quantity"],
      product_id: params["product_id"]
    )

    @order.save
    render "show.json.jbuilder"

    # price = Product.find_by(id: params["product_id"]).price

    # subtotal = price * params["quantity"].to_i

    # tax = subtotal * 0.08

    # total = subtotal + tax

    # @order = Order.new(
    #   product_id: params["product_id"],
    #   quantity: params["quantity"],
    #   user_id: current_user.id,
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: total)
    # if @order.save
    #   render "show.json.jbuilder"
    # else
    #   render json: {errors: @order.errors.full_messages, user: current_user}
    # end
  end
end
