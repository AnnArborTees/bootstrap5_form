# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module TextField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :text_field
      end
    end
  end
end
