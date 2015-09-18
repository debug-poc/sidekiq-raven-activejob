# Remove delayed extension so that we can use both DJ and sidekiq
# Since delayed job is not loaded we need not remove it. Reduces the
# chance of a conflict
# Sidekiq.remove_delay!

require 'sidekiq/api'

Sidekiq.default_worker_options = {retry: false}

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0', namespace: "sidekiq_app" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0', namespace: "sidekiq_app" }
end
