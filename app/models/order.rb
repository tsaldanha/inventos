class Order < ApplicationRecord
    after_save :update_inventory
    after_save :confirmation_email 
    after_save :inventory_email 
    after_save :cart_cleanup
    
    def update_inventory
        
    end
    
    def confirmation_email
        OrderMailer.confirmation_email(self).deliver_now
    end
    
    def inventory_email
        OrderMailer.inventory_email(self).deliver_now
    end 
    
    def cart_cleanup
        cart = Cart.find_by(customer_id: self.customer_id)
        cart.destroy!
    end
end
