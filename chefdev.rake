CHEF_NODE_NAME  = "vagrant-test.local"
VAGRANT_SSH_KEY = "/var/lib/gems/1.8/gems/vagrant-0.8.2/keys/vagrant"
CHEF_SERVER_URL = "http://192.168.86.103:4000"
CHEF_NODE_IP    = "192.168.86.104"

desc "clean"
task :clean do
  sh "knife node   delete #{CHEF_NODE_NAME} -y || true"
  sh "knife client delete #{CHEF_NODE_NAME} -y || true"
end

desc "back"
task :back do
  sh "vagrant snap back box4"
end

desc "build specific role"
task :build => [ :back, :clean ]
task :build, :role do |t, args|
  sleep 10
  sh"knife bootstrap #{CHEF_NODE_IP} -N #{CHEF_NODE_NAME} -r 'role[#{args.role}]' --no-host-key-verify -x vagrant --sudo -i #{VAGRANT_SSH_KEY} --server-url #{CHEF_SERVER_URL}"
end

# desc "run"
# task :run do
  # sh %!knife ssh 'fqdn:vagrantup.com' "sudo chef-client" -x vagrant -i /var/lib/gems/1.8/gems/vagrant-0.8.2/keys/vagrant !
# end
