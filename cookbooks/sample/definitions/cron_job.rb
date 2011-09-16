define :cron_job do
  file_path = params[:name]

  cron "" do
    hour params[:hour]
    minute params[:minute]
    command file_path
    action params[:action]
  end
  
  cookbook_file file_path do
    source params[:source]
    action params[:action]
    mode 0755
    owner "root"
    group "root"
  end
end
