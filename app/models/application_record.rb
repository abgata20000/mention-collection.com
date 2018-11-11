# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  extend Enumerize
  extend ActiveHash::Associations::ActiveRecordExtensions

  scope :unique_randoms, lambda { |limit = 1|
    ids = [*0..(count - 1)]
          .sample(limit)
          .map { |offset| offset(offset).first.id }
    where(id: ids)
  }

  class << self
    def randoms(limit = 1)
      record_count = count
      return [] if record_count.zero?

      [*0...limit].map do |_index|
        offset([*0...record_count].sample).first
      end
    end

    def random
      records = randoms
      records.empty? ? nil : records.first
    end

    def next_id
      last ? last.id + 1 : 1
    end

    def collection
      all.map { |data| [data.name, data.id] }
    end

    def destroy_all!(records)
      records = records.destroy_all
      raise ActiveRecord::RecordInvalid unless records.all?(&:destroyed?)
    end

    def now
      Time.zone.now
    end
  end

  def show_attributes
    attributes.each_with_object({}) do |(key, value), hash|
      hash[key] = if value.present? && value.is_a?(ActiveSupport::TimeWithZone)
                    I18n.l(value)
                  else
                    value
                  end
    end
  end

  def show_errors
    { errors: errors.full_messages }
  end

  def created_at_to_s
    I18n.l(created_at)
  end

  def updated_at_to_s
    I18n.l(updated_at)
  end

  private

  def now
    self.class.now
  end

  def notice_to_slack(message)
    MentionCollection::SlackUtils.post(message)
  end
end
