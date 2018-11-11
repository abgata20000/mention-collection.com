# frozen_string_literal: true

module ApplicationHelper
  def controller_and_action_classes
    tmp = controller_path.split("/")
    tmp.unshift("home") if tmp.size == 1
    "#{tmp.join(' ')} #{action_name}"
  end

  def controller_classes
    controller_path.tr("/", " ")
  end

  def head_title
    if content_for? :page_title
      "#{content_for(:page_title)} | #{Rails.application.config.site_name}"
    else
      Rails.application.config.site_name
    end
  end

  def model_column_t(model, column_name)
    t("activerecord.attributes.#{model.model_name.collection.singularize}.#{column_name}")
  end

  def javascript_void
    "javascript:void(0)"
  end

  def error_messages(resource)
    resource.errors.full_messages
  end

  def safe_to_date(datetime)
    datetime.nil? ? nil : datetime.to_date
  end

  def safe_to_date_l(datetime)
    date = safe_to_date(datetime)
    date.nil? ? nil : l(date)
  end

  def decorate(model_instance)
    ActiveDecorator::Decorator.instance.decorate(model_instance)
  end

  def today
    Time.zone.today
  end

  def now
    @now ||= Time.zone.now
  end

  def do_hash(value)
    require "digest/sha1"
    Digest::SHA1.hexdigest(value)
  end

  # rubocop:disable Rails/OutputSafety
  def nl2br(text)
    ERB::Util.html_escape(text).gsub(/\r\n|\r|\n/, "<br />").html_safe
  end
  # rubocop:enable Rails/OutputSafety

  def array_to_collection(values)
    values.map { |value| [value, value] }
  end

  def h(text)
    CGI.escapeHTML(text.to_s)
  end

  # rubocop:disable Rails/OutputSafety
  def auto_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = "<a href=\"#{url}\" target=\"_blank\">#{url}</a>"
      text.gsub!(url, sub_text)
    end
    text.html_safe
  end
  # rubocop:enable Rails/OutputSafety

  def for_logo_path
    root_path
  end
end
