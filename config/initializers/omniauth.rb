Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV["steam_api_key"]
end
