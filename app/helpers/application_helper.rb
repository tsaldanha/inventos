module ApplicationHelper
    def format_currency(value)
        ActiveSupport::NumberHelper.number_to_currency(value, :unit => "R$", separator: ",")
    end
end
