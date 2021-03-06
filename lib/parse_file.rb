$LOAD_PATH << '.'
require 'Parsedefs'
require 'find_loc'
require 'mongo_ops'

def parse_file(file_handle, dbname)
  banner=Dataset::Banner.new("banner")
  base=Dataset::Base.new("base")
#  no_region=NoRegion.new

  #create the mongodb object
  Mongo_ops.initialize(dbname)
  Mongo_ops.coll("collection")
  
  h=Hash.new

#  puts "this is the  file_handle", file_handle

  puts "File handle: #{file_handle}"

  file=File.new(file_handle, "r")
  
  username=file_handle.split(".")[0].gsub("dump/","")

#  puts username.inspect
  banner.username(username)

  ct=0
  
   while(b=file.gets)

     
     #now check where we are in the file
     ct=find_loc(b, ct)
     
     #store individual banner keys  -- foreach($attribute) write def in Parsedefs.rb
     
     case ct
       when 1
       #       puts "Parsing attributes from \"banner\""

       banner.command(b)
       banner.wallclock(b)
       banner.comm(b)
       banner.gflop(b)
       banner.host(b)
       banner.mpi_tasks(b)
       h=banner.finalize


#      puts "Parsing attributes from \"base\""
#       base.region(b)
       base.wallclock(b)
       base.comm(b)
       base.gflops(b)
       base.gbytes(b)
       base.functioncall(b)
       base.func_finalize
       base.finalize
       h=base.mergehash(h)

       when 2
#       puts "Parsing attributes from \"No region\""
#       puts b
#       no_region.region(b)
       
       

     end
     
#---------------end of banner level parse--------------------------
## Now scan for load balancing info for various attributes
# Base level timings

  end
  
#insert into database
  base.insert(h)
#  base.printhash
  
  puts h.inspect
  puts "Finished"


end



