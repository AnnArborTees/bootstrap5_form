# require 'bootstrap5_form/aliasing'

module Bootstrap5Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :layout, :label_col, :control_col, :has_error, :inline_errors,
                :label_errors, :acts_like_form_tag

    include Bootstrap5Form::Helpers::Field
    include Bootstrap5Form::Helpers::Bootstrap

    include Bootstrap5Form::FormGroupBuilder
    include Bootstrap5Form::FormGroup
    include Bootstrap5Form::Components

    include Bootstrap5Form::Inputs::Base
    include Bootstrap5Form::Inputs::CheckBox
    include Bootstrap5Form::Inputs::CollectionCheckBoxes
    include Bootstrap5Form::Inputs::CollectionRadioButtons
    include Bootstrap5Form::Inputs::CollectionSelect
    include Bootstrap5Form::Inputs::ColorField
    include Bootstrap5Form::Inputs::DateField
    include Bootstrap5Form::Inputs::DateSelect
    include Bootstrap5Form::Inputs::DatetimeField
    include Bootstrap5Form::Inputs::DatetimeLocalField
    include Bootstrap5Form::Inputs::DatetimeSelect
    include Bootstrap5Form::Inputs::EmailField
    include Bootstrap5Form::Inputs::FileField
    include Bootstrap5Form::Inputs::GroupedCollectionSelect
    include Bootstrap5Form::Inputs::MonthField
    include Bootstrap5Form::Inputs::NumberField
    include Bootstrap5Form::Inputs::PasswordField
    include Bootstrap5Form::Inputs::PhoneField
    include Bootstrap5Form::Inputs::RadioButton
    include Bootstrap5Form::Inputs::RangeField
    include Bootstrap5Form::Inputs::RichTextArea
    include Bootstrap5Form::Inputs::SearchField
    include Bootstrap5Form::Inputs::Select
    include Bootstrap5Form::Inputs::Submit
    include Bootstrap5Form::Inputs::TelephoneField
    include Bootstrap5Form::Inputs::TextArea
    include Bootstrap5Form::Inputs::TextField
    include Bootstrap5Form::Inputs::TimeField
    include Bootstrap5Form::Inputs::TimeSelect
    include Bootstrap5Form::Inputs::TimeZoneSelect
    include Bootstrap5Form::Inputs::UrlField
    include Bootstrap5Form::Inputs::WeekField

    include ActionView::Helpers::OutputSafetyHelper

    delegate :content_tag, :capture, :concat, :tag, to: :@template

    def initialize(object_name, object, template, options)
      warn_deprecated_layout_value(options)
      @layout = options[:layout] || default_layout
      @label_col = options[:label_col] || default_label_col
      @control_col = options[:control_col] || default_control_col
      @label_errors = options[:label_errors] || false
      @inline_errors = options[:inline_errors].nil? ? @label_errors != true : options[:inline_errors] != false
      @acts_like_form_tag = options[:acts_like_form_tag]
      add_default_form_attributes_and_form_inline options
      super
    end

    def add_default_form_attributes_and_form_inline(options)
      options[:html] ||= {}
      options[:html].reverse_merge!(Bootstrap5Form.config.default_form_attributes)

      return unless options[:layout] == :inline

      options[:html][:class] =
        safe_join(([*options[:html][:class]&.split(/\s+/)] + %w[row row-cols-auto g-3 align-items-center])
        .compact.uniq, " ")
    end

    def fields_for_with_bootstrap(record_name, record_object=nil, fields_options={}, &)
      fields_options = fields_for_options(record_object, fields_options)
      record_object = nil if record_object.is_a?(Hash) && record_object.extractable_options?
      fields_for_without_bootstrap(record_name, record_object, fields_options, &)
    end

    bootstrap_alias :fields_for

    # the Rails `fields` method passes its options
    # to the builder, so there is no need to write a `bootstrap5_form` helper
    # for the `fields` method.

    private

    def fields_for_options(record_object, fields_options)
      field_options = fields_options
      field_options = record_object if record_object.is_a?(Hash) && record_object.extractable_options?
      %i[layout control_col inline_errors label_errors].each do |option|
        field_options[option] ||= options[option]
      end
      field_options[:label_col] = field_options[:label_col].present? ? field_options[:label_col].to_s : options[:label_col]
      field_options
    end

    def default_layout
      # :vertical, :horizontal or :inline
      :vertical
    end

    def default_label_col
      "col-sm-2"
    end

    def offset_col(label_col)
      [*label_col].flat_map { |s| s.split(/\s+/) }.grep(/^col-/).join(" ").gsub(/\bcol-(\w+)-(\d)\b/, 'offset-\1-\2')
    end

    def default_control_col
      "col-sm-10"
    end

    def hide_class
      "visually-hidden" # still accessible for screen readers
    end

    def control_class
      "form-control"
    end

    def feedback_class
      "has-feedback"
    end

    def control_specific_class(method)
      "rails-bootstrap-forms-#{method.to_s.tr('_', '-')}"
    end
  end
end
