require 'spec_helper'

describe Admin do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

end
