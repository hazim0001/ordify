require 'twilio-ruby'

account_sid = 'ACcba7fc6699448939d687746c9d13de87'
auth_token = '1349e2f934e472ada8b3b2d54d3712da'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+12056547036' # Your Twilio number
to = '+529841452138' # Your mobile phone number

client.messages.create(
  from: from,
  to: to,
  body: "Hola from Ordify! test 2"
)
