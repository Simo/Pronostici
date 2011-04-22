Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, '1U17s6eIaLm3rlJTiOhgTA', 'IdPQ7SPCHRwjOaskYXbqrjLPsJ3MkSXjprHBWUyOI8'  
  provider :facebook, 'APP_ID', 'APP_SECRET'  
  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
end