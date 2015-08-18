#!/usr/bin/env ruby
dirs = Dir.entries('.').select do |e|
  File.directory? e
end

versions = "# Available versions:\n"
dirs.each do |d|
  versions << "* #{d}\n" unless d.match(/^\./)
end

text = File.read('README.md')
text.sub!(/# Available versions:\n(\* .*\n)+/, versions)
File.open('README.md', 'w') do |file|
  file.puts text
end
