require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it { should belong_to(:admin) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:admin_id) }
end
