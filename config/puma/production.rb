require 'puma/daemon' 
environment "production"

bind "unix:///usr/share/nginx/rails/tmp/sockets/puma.sock"
daemonize
