# frozen_string_literal: true

module Bootstrap5Form
  module Inputs
    module DateSelect
      extend ActiveSupport::Concern
      include Base

      included do
        bootstrap_select_group :date_select
      end
    end
  end
end
