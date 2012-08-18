Description
===========

This is a simple Chef report handler that reports status of a Chef run
through Growl.

* http://wiki.opscode.com/display/chef/Exception+and+Report+Handlers

Requirements
============

Platform: Mac OS X

Growl: Tested with version 1.3.2

Uses the `ruby_gntp` library.

Usage
=====

There are two ways to use Chef Handlers.

### Method 1

You can install the RubyGem ahead of time, and configure Chef to use
them. To do so:

    gem install chef-handler-growl

Then add to the configuration (`/etc/chef/solo.rb` for chef-solo or
`/etc/chef/client.rb` for chef-client):

    require "chef/handler/growl"
    report_handlers << Chef::Handler::Growl.new
    exception_handlers << Chef::Handler::Growl.new

### Method 2

Use the
[chef_handler cookbook by Opscode](http://community.opscode.com/cookbooks/chef_handler).
Create a recipe with the following:

    # Install the `chef-handler-growl` RubyGem during the compile phase
    chef_gem "chef-handler-growl"

    # Then activate the handler with the `chef_handler` LWRP
    chef_handler "Chef::Handler::Growl" do
      source "chef/handler/growl"
      action :enable
    end

Roadmap
=======

Things I would like to add:

* rspec tests - both Chef::Handler and GNTP#notify have specs, so this
  was low priority.
* GNTP over the network capability. For example, if I have three
  virtual machines running Chef on an interval, I'd like them to send
  notification to my Mac workstation I'm using.

These are created as issues. Pull requests welcome.

License and Author
==================

Author:: Joshua Timberman <opensource@housepub.org>
Copyright:: Copyright (c) 2012, Joshua Timberman
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
