if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Wl19S7V1BqL6eE4HNT6VmOhb',
    :secret_key => 'sk_test_GMc8oxxDWhGaDmoFf5ozwfMG'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Wl19S7V1BqL6eE4HNT6VmOhb',
    :secret_key => 'sk_test_GMc8oxxDWhGaDmoFf5ozwfMG'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]