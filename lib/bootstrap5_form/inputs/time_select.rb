# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module TimeSelect
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_select_group :time_select
      end
    end
  end
end
