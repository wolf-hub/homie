Rails.configuration.stripe = {
  :publishable_key => 'pk_live_mPLykOA8BXTXfzmmm0ozhmZ5',
  :secret_key => 'sk_live_xCrdypmZKlHzBFdZCfRNOP8M00qzCKFz6g'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
