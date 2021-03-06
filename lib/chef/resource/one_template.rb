# Copyright 2016, BlackBerry Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'chef/provider/one_template'

#
# Implementation of Resource class.
#
class Chef
  #
  # Implementation of Resource class.
  #
  class Resource
    #
    # Implementation of Resource class.
    #
    class OneTemplate < Chef::Resource::LWRPBase
      resource_name :one_template

      attribute :template, :kind_of => Hash, :default => {}
      attribute :template_file, :kind_of => String, :default => nil
      attribute :mode, :regex => [/^[0-7]{3}$/], :default => '600'
      attribute :driver

      actions :create, :create_if_missing, :delete
      default_action :create

      attr_accessor :exists
      attr_accessor :equal

      def initialize(*args)
        super
        @driver = run_context.chef_provisioning.current_driver
      end
    end
  end
end
