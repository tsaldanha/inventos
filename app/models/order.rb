class Order < ApplicationRecord
    after_save :update_inventory
    after_save :confirmation_email 
    
    def update_inventory
        
    end
    
    def confirmation_email
        OrderMailer.confirmation_email(self).deliver_now
    end
end
