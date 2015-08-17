#!/usr/bin/env ruby
class String
  def undent
    gsub(/^.{#{slice(/^ +/).length}}/, '')
  end
end

puts 'Enter download address:'
address = gets.chomp
puts 'Enter version name:'
name = gets.chomp
Dir.mkdir name unless File.exists? name
Dir.chdir name do
  File.write('Dockerfile', <<-EOS.undent
    FROM scratch
    MAINTAINER jiegec
    ADD #{address} /
    CMD ["/bin/bash"]
EOS
            )
end
