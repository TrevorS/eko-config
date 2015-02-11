require 'forwardable'
require 'eko-config/patterns'
require 'eko-config/version'
require 'eko-config/file'
require 'eko-config/section'

module EkoConfig

  def self.parse(file)
    EkoConfig::File.new(::File.basename(file), parse_sections(file))
  end

  def self.write(eko_file, file)
    ::File.open(file, 'w') do |f|
      eko_file.sections.each do |name, section|
        f.puts output_name(name)
        section.settings.each do |key, value|
          f.puts output_setting(key, value)
        end
      end
    end
  end

  private
  def self.parse_sections(file)
    current_section, last_key = nil
    ::File.open(file, 'r').each_with_object({}) do |line, sections|
      if name = Patterns.name =~ line && $1
        sections[name] = current_section = Section.new(name)
      elsif Patterns.setting =~ line
        key, value = line.split(':').map(&:strip)
        current_section[key] = value
        last_key = key
      elsif Patterns.indented =~ line
        current_section[last_key] << ' ' << line.strip
      end
    end
  end

  def self.output_name(name)
    ['[', name, ']'].join
  end

  def self.output_setting(key, value)
    [key, ':', value].join
  end
end
