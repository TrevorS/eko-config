module EkoConfig
  class Section
    extend Forwardable

    def_delegators :@settings, :[], :[]=

    @@indented = /^\s+[\w\s]+/

    def initialize
      @settings = {}
    end

    def add_setting(line)
      if @@indented =~ line
        @settings[@last_key] << ' ' << line.strip
      else
        key, value = line.split(":").map(&:strip)
        @settings[key] = value
        @last_key = key
      end
    end
  end
end
