require "sequel"

if %w[production staging].include?(ENV["RACK_ENV"])
  require "raven"

  Raven.configure do |config|
    config.dsn = ENV["SENTRY_DSN"]
  end
end

DB = Sequel.connect(
  adapter: "mysql2",
  host: ENV.fetch("DB_HOSTNAME"),
  database: ENV.fetch("DB_NAME"),
  user: ENV.fetch("DB_USER"),
  password: ENV.fetch("DB_PASS")
)

module Common;
  module Gateway; end
end

module PerformancePlatform
  module Gateway; end
  module Presenter; end
  module Repository; end
  module UseCase; end
end

module WifiUser
  module Gateway; end
  module Repository; end
  module UseCase; end
  module Domain; end
end

module Gdpr
  module UseCase; end
  module Gateway; end
end

require "require_all"

require_all "lib"
