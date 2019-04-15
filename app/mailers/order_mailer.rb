class OrderMailer < ApplicationMailer
    default from: "tadeusaldanha@gmail.com"
    layout 'mailer'
    
    def confirmation_email(order)
        @order = order
        @customer = Customer.find(@order.customer_id)
        mail to: @customer.email, subject: 'Seu pedido foi realizado #{@order.id}'
    end
    
end
