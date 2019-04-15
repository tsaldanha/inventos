class OrderMailer < ApplicationMailer
    default from: "minionstore@minionstore-test.com"
    layout 'mailer'
    
    def confirmation_email(order)
        @order = order
        @customer = Customer.find(@order.customer_id)
        @items = JSON.parse(@order.items)
        mail to: @customer.email, subject: 'Seu pedido na Minion Store foi realizado '
    end
    
    def inventory_email(order)
        @order = order
        @customer = Customer.find(@order.customer_id)
        @items = JSON.parse(@order.items)
        mail to: "rayssa@inventosdigitais.com.br", subject: 'Um pedido foi realizado na Minion Store'
    end
    
end
