# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aclifirenze_session',
  :secret      => '500280671790f0dbe0d3705fe6cf49530f9cd9bcc98390477f6bfdd926cc8c53f8765bbcda475ab5fae430c3b3af3a5f06455e7e7ad21e9f9c5f931f7ccda7f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
