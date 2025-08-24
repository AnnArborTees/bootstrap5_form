# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module WeekField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :week_field
      end
    end
  end
end
