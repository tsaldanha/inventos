class CartController < ApplicationController
    helper ApplicationHelper
    
    def index
        check
        @items = []
        session[:cart].each do |item|
            @items.push(get_item(item["id"]))    
        end
        @total = get_total
    end
    def get_item(id)
        @item = Product.find(id)
        return @item
    end 
    def check
        #had to hack devise on application controller, I had a conflit reading sessions after logout
        session[:cart] = [] unless session[:cart]
            
        if customer_signed_in?
            if Cart.exists?(customer_id: current_customer.id)
                @cart = Cart.find_by customer_id: current_customer.id
                session[:cart] = @cart.items
            end                
        end
    end
    def save
        totals = get_total
        if customer_signed_in? 
            if Cart.exists?(customer_id: current_customer.id)
                @cart = Cart.find_by customer_id: current_customer.id
                @cart.items = session[:cart]
                @cart.total = totals 
            else
                @cart = Cart.create(customer_id: current_customer.id, items: session[:cart], total: totals)
            end
            @cart.save
        end 
    end 
    
    def delete_item
        check
        product_id = params[:id]
        
        session[:cart].delete_if do |item| 
            true if item["id"] == product_id
        end 
        save
        redirect_to cart_index_path
    end
    
    def add_item
        check
        product_id = params[:id]
        price = params[:product_price]
        if !(find_item(product_id)) 
            item = {"id" => product_id, "price" => price, "qty" => "1"}
            session[:cart].push(item)
            save
        end 
        redirect_to cart_index_path
    end
    def get_total
        totals = 0.0
        session[:cart].each do |i|
            totals += i["price"].to_f
        end
        return totals
    end
    def find_item(product_id)
        finder = false
        return finder unless session[:cart]
        session[:cart].each do |i|
            finder = true if i["id"] == product_id
        end
        return finder
    end 
    
end
