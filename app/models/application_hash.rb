class ApplicationHash < ActiveHash::Base
  include ActiveHash::Associations

  class << self
    def to_array
      all.map(&:name)
    end

    def inclusion
      all.map(&:id)
    end

    def collection
      all.map { |data| [data.name, data.id] }
    end

    def index(index)
      all[index]
    end

    def unique_randoms(limit = 1)
      [*0..(count - 1)]
        .sample(limit)
        .map { |index| index(index) }
    end

    def random
      object = unique_randoms
      object.empty? ? nil : object.first
    end

    def keys
      all.map(&:key)
    end

    def find_by_key(key)
      find_by(key: key)
    end
  end
end
