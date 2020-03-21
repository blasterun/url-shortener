module Models
  class Url
    @urls = {}

    class << self
      def find(key)
        @urls[key]
      end

      def add(key, value)
        @urls[key] = value
      end
    end
  end
end
