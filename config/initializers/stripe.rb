Rails.configuration.stripe = {
  :publishable_key => 'pk_test_Xm7dnVKfBfUznTpXHale0Cwu00yBvVDFHp',
  :secret_key => 'sk_test_Bo9H4D1IIf6iXB7KRZprplfR00ng7VATcC'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
