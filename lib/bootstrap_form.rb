require "action_view"
require "action_pack"
require "bootstrap5_form/action_view_extensions/form_helper"

module Bootstrap5Form
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Configuration
    autoload :FormBuilder
    autoload :FormGroupBuilder
    autoload :FormGroup
    autoload :Components
    autoload :Inputs
    autoload :Helpers
  end

  class << self
    def eager_load!
      super
      Bootstrap5Form::Components.eager_load!
      Bootstrap5Form::Helpers.eager_load!
      Bootstrap5Form::Inputs.eager_load!
    end

    def config
      @config ||= Bootstrap5Form::Configuration.new
    end

    def configure
      yield config
    end
  end

  mattr_accessor :field_error_proc
  # rubocop:disable Style/ClassVars
  @@field_error_proc = proc do |html_tag, _instance_tag|
    html_tag
  end
  # rubocop:enable Style/ClassVars
end

require "bootstrap5_form/engine" if defined?(Rails)
