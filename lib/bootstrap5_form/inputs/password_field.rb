# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module PasswordField
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_field :password_field
      end
    end
  end
end
