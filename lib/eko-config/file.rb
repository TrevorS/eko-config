module EkoConfig
  class File
    extend Forwardable

    attr_reader :name, :sections
    def_delegators :@sections, :[], :[]=

    def initialize(name, sections)
      @name     = name
      @sections = sections
    end
  end
end
