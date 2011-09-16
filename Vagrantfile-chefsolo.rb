Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.network "192.168.86.111"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.run_list = "recipe[sample]"
  end
end
