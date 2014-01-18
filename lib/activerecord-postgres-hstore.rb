require 'active_support'

if RUBY_PLATFORM == "jruby"
  require 'activerecord-jdbcpostgresql-adapter'
else
  require 'pg'
end

if defined?(Rails)
  if Rails.version >= '3.0.0'
    require "activerecord-postgres-hstore/railties"
  else
    # in our version of rails, we can't require 'rails' or use on_load
    # so we just force the require here and skip the railties
    require 'active_record/connection_adapters/postgresql_adapter'
    require "activerecord-postgres-hstore/activerecord"
  end
else
  ActiveSupport.on_load :active_record do
    require "activerecord-postgres-hstore/activerecord"
  end
end
require "activerecord-postgres-hstore/string"
require "activerecord-postgres-hstore/hash"
require "activerecord-postgres-hstore/coder"
