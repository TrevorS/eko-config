module EkoConfig
  class File
    extend Forwardable

    @@name  = /\[\s*\b([\w\s]+)\b\s*\]/
    @@data = /\S/

    def_delegators :@sections, :[], :[]=

    def initialize(file)
      @sections = parse(file)
    end

    private
    def parse(file)
      current_section = nil
      ::File.open(file, 'r').each_with_object({}) do |line, sections|
        puts "line: #{line}"
        name = section_name(line)
        if name
          sections[name] = current_section = Section.new
        elsif @@data =~ line
          current_section.add_setting(line)
        end
      end
    end

    def section_name(line)
      @@name =~ line && $1
    end
  end
end
