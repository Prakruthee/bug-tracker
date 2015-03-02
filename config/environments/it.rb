  BugTracker.application.configure do

    config.cache_classes = true
    config.eager_load = true
    config.consider_all_requests_local       = false
    config.action_controller.perform_caching = true
    config.serve_static_assets = false
    config.assets.enabled = true
    config.assets.digest = true
    config.assets.js_compressor = :uglifier
    config.assets.css_compressor = :sass
    config.assets.compile = true
    config.assets.precompile =  ['*.js', '*.css', '*.css.erb']
    config.assets.compress = true
    config.assets.debug = false
    config.assets.version = '1.0'
    config.log_level = :debug
    config.i18n.fallbacks = true
    config.active_support.deprecation = :notify
    config.log_formatter = ::Logger::Formatter.new
    config.action_mailer.asset_host = 'http://it.bug-tracker.qwinixtech.com
/'
    config.action_mailer.default_url_options = { :host => 'it.bug-tracker.qwinixtech.com
' }
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default :charset => "utf-8"


  end