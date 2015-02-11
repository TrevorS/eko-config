module EkoConfig
  class Section
    extend Forwardable

    attr_reader :name, :settings
    def_delegators :@settings, :[], :[]=

    def initialize(name)
      @name     = name
      @settings = {}
    end
  end
end
