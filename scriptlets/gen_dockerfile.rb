#!/usr/bin/env ruby
class String
  def undent
    gsub(/^.{#{slice(/^ +/).length}}/, '')
  end
end

puts 'Enter download address:'
address = gets.chomp
name = address.sub(/^.*aosc-os[0-9]?[_-]/, '')
name = name.sub(/\.tar\.xz$/, '')

Dir.mkdir name unless File.exist? name
Dir.chdir name do
  system 'wget', "#{address}"
  File.write('Dockerfile', <<-EOS.undent
    FROM scratch
    MAINTAINER jiegec
    ADD #{address} /
    CMD ["/bin/bash"]
EOS
            )
end
