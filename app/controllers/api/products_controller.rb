class Api::ProductsController < ApplicationController
  
  def index
    @products = Product.all

    #search_terms = params[:search]
     # if search_terms
      #  @products = @products.where("name ILIKE ?", "%#{search_terms}%")
      #end

    @products = @products.order(:id => :asc)

    search_name = params[:name]
    if search_name
      @products = @products.where("name ILIKE ?", "%" + search_name + "%")
    end

    render "index.json.jbuilder"
  end

  def show
    input_id = params["id"]
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
     )
    if @product.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end  

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed!"}
  end  
end




