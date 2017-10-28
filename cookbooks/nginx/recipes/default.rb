#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

  bash "nginx download" do
  code <<-EOH
    cd /tmp
    wget http://mirror.vbctv.in/epel/7Server/x86_64/e/epel-release-7-9.noarch.rpm
    rpm –ivh epel-release-7-9.noarch.rpm
    yum repolist
    yum install Nginx
  EOH
  end

  template "/etc/nginx/nginx.conf" do
    source "nginx.erb"
    mode "0644"
  end

  template "/usr/share/nginx/html/index.html" do
    source "index.erb"
    mode "0644"
  end

  template "/usr/share/nginx/html/1.html" do
    source "1.erb"
    mode "0644"
  end

  template "/usr/share/nginx/html/2.html" do
    source "2.erb"
    mode "0644"
  end

  template "/usr/share/nginx/html/3.html" do
    source "3.erb"
    mode "0644"
  end

service "nginx" do
  action [:enable, :start]
end
