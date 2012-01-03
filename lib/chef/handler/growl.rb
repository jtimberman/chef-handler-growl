#
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2012, Joshua Timberman
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/handler'
require 'ruby_gntp'

class Chef
  class Handler
    class Growl < Chef::Handler
      def report
        title = Chef::Config[:solo] ? "Chef Solo" : "Chef Client"
        icon = "http://www.opscode.com/images/OC_Chef_Logo.png"
        text = if run_status.success?
                 "Chef complete on #{node.name} in #{run_status.elapsed_time}"
               else
                 "Chef failed on #{node.name} with #{run_status.exception}"
               end

        GNTP.notify(
          :app_name => "Chef",
          :title => title,
          :text => text,
          :icon => icon
        )
      end
    end
  end
end
