require 'net/http'
require 'json'
require 'byebug'
require "net/https"
require "uri"

## to get the token

uri = URI.parse('https://accept.paymobsolutions.com/api/auth/tokens')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
req.body = { "api_key": "CHECK ENV" }.to_json
res = http.request(req)
# puts "response #{res.body}"
reply = JSON.parse(res.body)
auth_token = reply["token"]
# puts reply

## to pass the order

# required -> auth_token string, delivery_needed string, amount_cents string, items [] array
def pass_order(auth_token)
  uri = URI.parse('https://accept.paymobsolutions.com/api/ecommerce/orders')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
  req.body = {
    "auth_token": auth_token,
    "delivery_needed": "false",
    "amount_cents": "1000",
    "currency": "EGP",
    "items": [
      {
        "name": "Test item",
        "amount_cents": "500",
        "description": "Test item",
        "quantity": "2"
      }
    ]
  }.to_json
  res = http.request(req)
  # puts "response #{res.body}"
  reply = JSON.parse(res.body)
  reply["id"]
  # byebug
end

payment_id = pass_order(auth_token)

def payment_key_request(payment_id, auth_token)
  uri = URI.parse('https://accept.paymobsolutions.com/api/acceptance/payment_keys')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  req = Net::HTTP::Post.new(uri.path, { "Content-Type": "application/json", "Accept": "application/json" })
  req.body = {
    "auth_token": auth_token,
    "amount_cents": "100",
    "expiration": 6000,
    "order_id": payment_id,
    "billing_data": {
      "apartment": "NA",
      "email": "test@test.com",
      "floor": "NA",
      "first_name": "test",
      "street": "NA",
      "building": "NA",
      "phone_number": "00000000000",
      "shipping_method": "NA",
      "postal_code": "NA",
      "city": "NA",
      "country": "NA",
      "last_name": "test",
      "state": "NA"
    },
    "currency": "EGP",
    "integration_id": 171_112
  }.to_json
  res = http.request(req)
  reply = JSON.parse(res.body)
  reply["token"]
end

puts payment_key_request(payment_id, auth_token)


















