# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pe-log_session',
  :secret      => 'a41a786700267f9e589e8ed80b7e3e2f064f8e4bfcb51a4d7126f161d8e6d23f397a48d42f10bea25b449f410cc60ffb5feabe45f121a438967fc71bc512ce62'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
