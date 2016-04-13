require 'sinatra'

class App < Sinatra::Base

  get '/' do
    # This should be changed when you're in production environment
    # https://sohapay.vn/payment.php
    @gateway_url      = "http://paydoitac.todo.vn/demoshop/pay.php"
    @return_url       = "http://localhost:9393/return_url"
    @order_code       = "12345-#{Time.now.to_i}"
    @price            = "10000"
    @order_email      = "test@example.haxxors"
    @order_mobile     = "0900000001"
    @transaction_info = "test"
    @embed_type       = "desktop" # we need to support mobile view dynamically :(
    @language         = "vi"

    erb :form
  end

  post '/return_url' do
    # Redirect somewhere (e.g summary page)
  end

end

run App
