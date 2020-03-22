module Models
  class Url
    @urls = {}

    class << self
      def find(key)
        @urls[key]
      end

      def save(key:, url:)
        @urls[key] = url
      end
    end
  end
end
