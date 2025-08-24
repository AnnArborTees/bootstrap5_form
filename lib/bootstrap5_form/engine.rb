# frozen_string_literal: true

require "rails/railtie"

module Bootstrap5Form
  class Engine < Rails::Engine
    config.eager_load_namespaces << Bootstrap5Form
    config.autoload_paths << File.expand_path("lib", __dir__)
  end
end
