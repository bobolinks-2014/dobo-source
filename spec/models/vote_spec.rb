require 'spec_helper'

describe Vote do
  it { should belong_to(:tally) }
  it { should belong_to(:user) }
end
