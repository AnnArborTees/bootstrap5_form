# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module EmailField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :email_field
      end
    end
  end
end
