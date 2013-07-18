# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
unless Rails.env.production?
  PoetrySite::Application.config.secret_token = '73cfd85c869bdf56671c567b0608f7b4c8d6f6a48a049040b87cbe456b678ea9420a5af1213f11838cd8e44b15a5cc82bba4d974e6cdde9384264986ccd1b96a'
  PoetrySite::Application.config.secret_key_base = '7b87fb5d674c47dd2c7a1ae309d94cbad319838dba7eab76f898707b21679833fd2fcad07756168aba23347a490d9e555f6ad7c30fc659c81ef1c5af19498e86'
else
  PoetrySite::Application.config.secret_token = ENV['HONK_HONK']
  PoetrySite::Application.config.secret_key_base = ENV['CHOO_CHOO']
end
