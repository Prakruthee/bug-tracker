OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, (ENV['FB_APP_ID'] || '620754781359571'),
 (ENV['FB_APP_SECRET'] || 'e151f4d103c02ef1d962c1d7d8d7b232'), :strategy_class =>
 OmniAuth::Strategies::Facebook
end