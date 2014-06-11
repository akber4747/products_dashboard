class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
       @product = Product.find(params[:id])
       @comment = Comment.new
          @comments = Comment.all

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash.now[:success] = "You dun added a produck"
      render 'show'
    else
      flash.now[:error] = @product.errors.full_messages
      render 'new'
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash.now[:success] = "u updated de produc"
      render 'show'
    else 
      flash.now[:error] = @product.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:delete_success] = "u deleted it"
    redirect_to products_path
  end

  private
   def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end
end
