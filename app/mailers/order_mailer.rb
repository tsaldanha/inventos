class OrderMailer < ApplicationMailer
    default from: "minionstore@minionstore-test.com"
    layout 'mailer'
    
    def confirmation_email(order)
        @order = order
        @customer = Customer.find(@order.customer_id)
        mail to: @customer.email, subject: 'Seu pedido na Minion Store foi realizado '
    end
    
end
