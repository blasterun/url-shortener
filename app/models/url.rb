module Models
  class Url
    @urls = {}

    class << self
      def find(key)
        @urls[key]
      end

      def add(key:, url:)
        @urls[key] = url
      end
    end
  end
end
