class ProductsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    before_action :set_program

    before_action :set_product, only: [:create, :update, :edit, :destroy]


    def index
        @products=Product.all
    end

    def add_to_cart
        id = params[:id].to_i
        session[:cart] << id unless session[:cart].include?(id)
        redirect_to products_path
    end

    def remove_from_cart
        id = params[:id].to_i
        session[:cart].delete(id)
        redirect_to products_path
    end

    def new 
        @product = @program.products.build
    end

    def create
        @product = @programs.products.build(product_params)

        if @product.save
            redirect_to products_path(@product),
            notice: "product was successfully created"

        else
            render :new, status: :unprocessable_entity
        end
    end


    def edit
    end

    def update

        if @product.update(product_params)
            redirect_to products_path(@product),
            notice: "product was successfully updated"

        else
            render :new, status: :unprocessable_entity
        end
    end 


    def destroy
      @product.destroy
      redirect_to products_path, notice: "product wa ssucessfully destroyed"
    end
    
    private

    def product_params
        params.require(:product_name).permit(:price_id, :program_id, :price)
    end

    def set_product
       @product= Product.find(params[:id])
    end

    def set_program
        # @program= Program.find(params[:program_id])
    end
end
