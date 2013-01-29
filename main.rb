#call parser/dumper
#put parser here for now

$LOAD_PATH << './lib'

require 'parse_file'
require 'mongo_ops'

#'main'

a=`ls dump-#{ARGV[0]}`.split("\n")
database=ARGV[0]

a.each do |x|

  puts "\nInserting file \t", x.inspect 
  print "\n"

    parse_file("dump-#{ARGV[0]}/#{x}", ARGV[0].to_s)
end

