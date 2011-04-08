require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
end
