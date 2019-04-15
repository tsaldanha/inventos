class OrderController < ApplicationController
    helper ApplicationHelper
    
    before_action :require_login
    before_action :require_cart
    
    def index
        
    end
    
    def new
        @customer = Customer.find(current_customer.id)
        @items = get_cart
        @total = @cart.total
    end 
    
    def get_cart
        @cart = Cart.find_by customer_id: current_customer.id
        @items = []
        @cart.items.each do |item|
            item = get_item(item["id"])
            @items.push(item)
        end
        return @items
    end
    def get_item(id)
        @item = Product.find(id)
        return @item
    end 
        
    def show
         
    end
    
    def create
        #verificar se já existe um pedido.
        #unless Order.exists?(customer_id: current_customer.id)
            @cart = Cart.find_by customer_id: current_customer.id
            @items = get_cart
            @customer = Customer.find(current_customer.id)
            #salvar o pedido
            @order = Order.create(customer_id: current_customer.id, customer: @customer.to_json, items: @items.to_json, total_price: @cart.total)
            #destruir o carrinho no DB e zerar a sessão.
            session[:cart] = []
        #else
        #    redirect_to cart_index_path
        #end
    end
    def require_login
        unless customer_signed_in? 
            redirect_to new_customer_session_path
        end
    end
    
    def require_cart
        unless Cart.exists?(customer_id: current_customer.id)
            redirect_to new_customer_session_path
        end 
    end 
end
