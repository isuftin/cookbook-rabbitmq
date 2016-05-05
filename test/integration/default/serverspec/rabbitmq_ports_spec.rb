require 'spec_helper.rb'

describe iptables do
  it { should have_rule('-A FWR -p tcp -m tcp --dport 5672 -j ACCEPT') }
  it { should have_rule('-A FWR -p tcp -m tcp --dport 15672 -j ACCEPT') }
end