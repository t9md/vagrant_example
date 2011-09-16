Vagrant::Config.run do |config|
  # web
  config.vm.define :web do |c|
    c.vm.box = "lucid64new"
    c.vm.box_url = "http://intra.local/box/lucid64.box" # --(2)
    c.vm.network "192.168.86.201"
    c.vm.customize { |v| v.name = "web" }
  end

  # db
  config.vm.define :db do |c|
    c.vm.box = "lucid64new"
    c.vm.box_url = "http://intra.local/box/lucid64.box" # --(2)
    c.vm.network "192.168.86.202"
    c.vm.customize { |v| v.name = "db" }
  end
end
