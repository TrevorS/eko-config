require 'spec_helper'

describe EkoConfig::Section do
  before(:all) do
    @section = EkoConfig::Section.new('Section')
  end

  it 'responds to name' do
    expect(@section).to respond_to(:name)
  end

  it 'responds to settings' do
    expect(@section).to respond_to(:settings)
  end

  it 'starts with no settings' do
    expect(@section.settings).to eq({})
  end

  it 'accepts new settings' do
    name = 'key'
    @section[name] = 'value'
    expect(@section[name]).to be_truthy
  end
end
