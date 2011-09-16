execute "apt-get update"

package "apache2" do
  action :install
end

file "/var/www/index.html" do
  content "hello #{node[:os]}\n"
end

template "/var/tmp/sample.conf" do
  source "sample.erb"
  variables(
    :port => 80,
    :addr => node.ipaddress
    )
  owner "root"
  group "root"
  mode "644"
end

# definition sample
cron_job "/usr/local/bin/hello_world.sh" do
  hour "5"
  minute "0"
  source "hello_world.sh"
  action :create
  # action :delete
end

# LWRP sample 
# LWRP's name is composed with {recipename}_{rwrp_name}.
# parameters (or resource attributes) are defined in {recipename}/resources/{rwrp_name}.rb
# actions are defined in {recipename}/providers/{rwrp_name}.rb
sample_greet "hello" do 
  path "/var/tmp/greet1"
  action :add
end

sample_greet "bye" do 
  path "/var/tmp/greet2"
  times 5
  upcase true
  # action :add
  action :remove
end
