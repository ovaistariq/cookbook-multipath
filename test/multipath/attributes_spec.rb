#
# Cookbook Name:: nfs
# Test:: attributes_spec
#
# Author:: Fletcher Nichol
# Author:: Eric G. Wolfe
#
# Copyright 2012, Fletcher Nichol
# Copyright 2012, Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require File.join(File.dirname(__FILE__), %w{.. support spec_helper})
require 'chef/node'
require 'chef/platform'

describe 'Multipath::Attributes::Default' do
  let(:attr_ns) { 'multipath' }

  before do
    @node = Chef::Node.new
    @node.consume_external_attrs(Mash.new(ohai_data), {})
    @node.from_file(File.join(File.dirname(__FILE__), %w{.. .. attributes default.rb}))
  end

  describe "for unknown platform" do
    let(:ohai_data) do
      { :platform => "unknown", :platform_version => "3.14" }
    end

    it "sets the package list to device-mapper-multipath" do
      @node.default[attr_ns]['packages'] = %w{ device-mapper-multipath }
    end

    it "sets the server service to multipathd" do
      expect(@node[attr_ns]['service']).to eq("multipathd")
    end
  end

  describe "for unknown platform" do
    let(:ohai_data) do
      { :platform => "redhat", :platform_version => "5.9" }
    end

    it "sets the package list to device-mapper-multipath" do
      @node.default[attr_ns]['packages'] = %w{ device-mapper-multipath }
    end

    it "sets the service to multipathd" do
      expect(@node[attr_ns]['service']).to eq("multipathd")
    end
  end

  describe "for ubuntu 10 platform" do
    let(:ohai_data) do
      { :platform => "ubuntu", :platform_version => "10.04" }
    end

    it "sets a package list to multipath-tools" do
      expect(@node.default[attr_ns]['packages']).to eq(%w{ multipath-tools })
    end

    it "sets the service to multipath-tools" do
      expect(@node[attr_ns]['service']).to eq("multipath-tools")
    end
  end
end
