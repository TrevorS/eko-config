require 'spec_helper'

describe EkoConfig::File do
  before(:all) do
    section_name = 'TestSection'
    @section     = EkoConfig::Section.new(section_name)
    sections     = { section_name => @section }
    @file        = EkoConfig::File.new('TestFile', sections)
  end

  it 'responds to name' do
    expect(@file).to respond_to(:name)
  end

  it 'responds to sections' do
    expect(@file).to respond_to(:sections)
  end

  it 'has a section' do
    expect(@file['TestSection']).to eq(@section)
  end

  it 'accepts new sections' do
    name = 'Section'
    @file[name] = EkoConfig::Section.new(name)
    expect(@file[name]).to be_truthy
  end
end
