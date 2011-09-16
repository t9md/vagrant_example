action :add do
  # message = new_resource.message
  message = ""
  file new_resource.path do
    message = "hello #{new_resource.message * new_resource.times}\n"
    message.upcase! if new_resource.upcase
    content message
    action :create
  end
end

action :remove do
  file new_resource.path do
    action :delete
  end
end
