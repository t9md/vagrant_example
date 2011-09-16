def my_pubkey
  File.read(File.expand_path("~/.ssh/id_rsa.pub"))
end

def setup
<<EOS
[ -d /root/.ssh ] || mkdir -p /root/.ssh && \
echo '#{my_pubkey}' > /root/.ssh/authorized_keys && \
chmod 600 /root/.ssh/authorized_keys
EOS
end

Vagrant::Config.run do |config|
  config.vm.box = "base"
  config.vm.network "192.168.86.111"
  config.ssh.private_key_path
  config.vm.provision :shell, :inline => setup
end
