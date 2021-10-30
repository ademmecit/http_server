require 'socket'

server  = TCPServer.new('0.0.0.0', 80)

loop {
  client  = server.accept
  request = client.readpartial(2048)

  method, path, version = request.lines[0].split

  puts "#{method} #{path} #{version}"


  client.write("HTTP/1.1 200\r\n") # 1
  client.write("Content-Type: text/html\r\n") # 2
  client.write("\r\n") # 3

  if path == "/healthcheck"
    puts "healthcheck"
    client.write("OK")
  else
    puts "other"
    client.write("Well, hello there!")
  end


  client.close
}
