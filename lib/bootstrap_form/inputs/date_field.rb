# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module DateField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :date_field
      end
    end
  end
end
