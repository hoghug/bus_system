require 'spec_helper'

describe Arrival do
  it { should belong_to :bus }
  it { should belong_to :stop }

end
