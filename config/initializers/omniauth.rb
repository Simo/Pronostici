require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, '1U17s6eIaLm3rlJTiOhgTA', 'IdPQ7SPCHRwjOaskYXbqrjLPsJ3MkSXjprHBWUyOI8'
  provider :facebook, '195811290456768', '31236acbdd1e242ae6a65c2fa11ee602'
end