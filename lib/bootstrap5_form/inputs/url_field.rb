# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module UrlField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :url_field
      end
    end
  end
end
