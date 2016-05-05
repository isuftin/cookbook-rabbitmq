require 'spec_helper.rb'

describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end