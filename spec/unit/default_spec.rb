require 'spec_helper'

describe 'multipath::default' do
  platforms = {
    'ubuntu' => {
      'package'   => 'multipath-tools',
      'service'   => 'multipath-tools',
      'versions'  => ['10.04', '12.04']
    },
    'centos' => {
      'package'   => 'device-mapper-multipath',
      'service'   => 'multipathd',
      'versions'  => ['5.9', '6.4']
    }
  }

  platforms.each do |platform, platform_details|
    platform_details['versions'].each do |version|
      context "On #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version).converge(described_recipe)
        end

        it "installs the #{platform_details['package']} package" do
          expect(chef_run).to install_package(platform_details['package'])
        end

        it "enables the #{platform_details['service']} service" do
          expect(chef_run).to enable_service(platform_details['service'])
        end

        it "starts the #{platform_details['service']} service" do
          expect(chef_run).to start_service(platform_details['service'])
        end

        it 'renders /etc/multipath.conf' do
          expect(chef_run).to render_file('/etc/multipath.conf').with_content(/user_friendly_names yes/)
        end

        it 'configures multipath for PureStorage SAN' do
          chef_run.node.set['multipath']['storage_type'] = "purestorage"
          chef_run.converge(described_recipe)

          expect(chef_run).to render_file('/etc/multipath.conf').with_content(/vendor "PURE"/)
          expect(chef_run.template('/etc/multipath.conf')).to notify("service[#{platform_details['service']}]").to(:restart).delayed
        end
      end
    end
  end
end
