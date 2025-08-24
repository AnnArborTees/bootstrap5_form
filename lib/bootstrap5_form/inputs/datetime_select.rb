# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module DatetimeSelect
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_select_group :datetime_select
      end
    end
  end
end
