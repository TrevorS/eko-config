module EkoConfig
  module Patterns
    def self.name
      /\[\s*\b([\w\s]+)\b\s*\]/
    end

    def self.indented
      /^\s+[\w\s]+/
    end

    def self.settings
      /.+:.+/
    end
  end
end
