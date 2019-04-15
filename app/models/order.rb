class Order < ApplicationRecord
    after_save :update_inventory
    
    def update_inventory
        
    end
    
end
