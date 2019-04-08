class Product < ApplicationRecord
    def format_currency
        ActiveSupport::NumberHelper.number_to_currency(price, :unit => "R$", separator: ",")
    end
end
