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

  get '/return_url' do
    # Sample payload that has been sent to this URL.
    # order_code=12345-1460535286&order_email=test%40example.haxxors&order_session=869fbdcb9e887c3eebe3af5a436bddca&payment_bank_code=0021.0018.39243&payment_bank_holder=C%C3%B4ng+ty+C%E1%BB%95+ph%E1%BA%A7n+Truy%E1%BB%81n+th%C3%B4ng+Vi%E1%BB%87t+Nam&payment_coupon=806122&payment_fullname=Ng%C3%A2n+h%C3%A0ng+Vietcombank+%28VCB%29+H%C3%A0+N%E1%BB%99i&payment_name=Vietcombank&payment_time=2016-04-13+15%3A16%3A14&payment_type=7&price=10000&response_code=0&response_message=Approved&site_code=test&transaction_info=test&secure_code=2CADDC0EC79B1FA6A659E72EC7086DD5790448A3BA9A371FA20058BB3FE7C6E6
    #
    @price             = params[:price]
    @order_code        = params[:order_code]
    @order_email       = params[:order_email]
    @payment_name      = params[:payment_name]
    @payment_coupon    = params[:payment_coupon]
    @response_code     = params[:response_code]
    @payment_bank_code = params[:payment_bank_code]
    @response_message  = params[:response_message]
    @transaction_info  = params[:transaction_info]
    @secure_code       = params[:secure_code]

    erb :summary
  end

end

run App
