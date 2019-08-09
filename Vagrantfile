Vagrant.configure("2") do |config|
  config.vm.box = "./bionic64-vbox.box"
  config.vm.provision "shell", path: "./scripts/vagrant-apps-set.sh", privileged: false
  config.vm.define "web-counter" do |c1|
    c1.vm.hostname = "web-counter"
    c1.vm.network :forwarded_port, host: 8000, guest: 80
  end
end