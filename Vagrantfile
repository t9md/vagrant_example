vagrant_dev_path = "/home/maeda_taku/local/github/vagrant-snap/lib"
# vagrant_snap_init = File.join( vagrant_dev_path, "vagrant_init.rb")
$LOAD_PATH.unshift vagrant_dev_path

# require "vagrant_snap"
Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.network :hostonly, "192.168.86.210"
  # config.vm.network "192.168.86.111"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.run_list = "recipe[sample]"
  end
end
