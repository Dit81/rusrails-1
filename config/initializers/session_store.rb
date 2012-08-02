# Be sure to restart your server when you modify this file.

Rusrails::Application.config.session_store :cookie_store, key: '_blog_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Rusrails::Application.config.session_store :active_record_store
Rusrails::Application.config.session = {
  :key          => '_omniauthpure_session',     # name of cookie that stores the data
  :domain       => nil,                         # you can share between subdomains here: '.communityguides.eu'
  :expire_after => 1.month,                     # expire cookie
  :secure       => false,                       # fore https if true
  :httponly     => true,                        # a measure against XSS attacks, prevent client side scripts from accessing the cookie
  
  :secret      => 'af854f5336b637f38ca4467713d854e7be559f2e8986ea9b2594deddecf0144ed95019cb5001bd1c3264eedd17d85b81f893bd86516586e437725b749a264abc'
}