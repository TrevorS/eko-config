require 'spec_helper'

describe EkoConfig::Patterns do
  it 'correctly matches name' do
    EkoConfig::Patterns.name =~ '[Section Name]'
  end

  it 'correctly matches name with spaces' do
    EkoConfig::Patterns.name =~ '[ Section Name ]'
  end

  it 'correctly matches indented' do
    EkoConfig::Patterns.indented =~ '  Indented'
  end

  it 'correctly matches settings' do
    EkoConfig::Patterns.settings =~ 'key:value'
  end

  it 'correctly matches settings with spaces' do
    EkoConfig::Patterns.settings =~ 'key : value'
  end
end
