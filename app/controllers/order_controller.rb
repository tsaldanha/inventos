class OrderController < ApplicationController
    def index
        
    end
    
    def new
        @customer = Customer.find(current_customer.id)
        @items = get_cart
        @total_currency = format_currency(@order_total)
    end 
    
    def get_cart
        @cart = Cart.find_by customer_id: current_customer.id
        @items = []
        @order_total = 0
        @cart.items.each do |item|
            item = get_item(item["id"])
            @items.push(item)
            @order_total += item.price
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
        #salvar o pedido
        #reduzir o estoque dos itens
        #destruir o carrinho no DB e zerar a sessão.
    end
    
    def format_currency(value)
        ActiveSupport::NumberHelper.number_to_currency(@order_total, :unit => "R$", separator: ",")
    end
end
