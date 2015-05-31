require 'spec_helper'

describe 'multipath::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'centos', version: 6.5).converge('multipath::default')
  end

  it 'sets the server service to multipathd' do
    expect(chef_run.node['multipath']['service']).to eq("multipathd")
  end
end
