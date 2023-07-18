Sentry.init do |config|
  config.dsn = ENV['DSN_SENTRY']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.traces_sample_rate = 1.0
  config.traces_sampler = lambda do |_context|
    true
  end
end
