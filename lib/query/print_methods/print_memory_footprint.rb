#!/usr/bin/ruby
class Print_things
  attr_reader :maxmem
  @maxmem=24 #GB
  def self.print_memory_footprint(dumpfile)
    file=File.new("data/#{dumpfile}/mem_footprint.txt","w")
    file1=File.new("data/#{dumpfile}/mem_footprint_username.txt","w")
    file2=File.new("data/#{dumpfile}/mem_footprint_command.txt","w")
    if(!File.directory?("data/#{dumpfile}"))
      Dir.mkdir("data/#{dumpfile}")
    end

    h=Query_operations.mem_footprint("banner.wallclock"=>{"$gt"=>@wall_filter})
    
    h.each do 
      |x|
      file.printf("%-15d%-15d%-15d%-15f%-15s%-15s\n", 
                  x["wallclock"].to_i, x["concurrency"], x["gbytes"],
                  x["gbytes"].to_f/x["nodes"].to_f, x["username"],
                  x["command"])

#      file2.printf("%-15s\n",
#                   x["command"])
    end

    file.close
    file1.close
    file2.close
    
  end
end    
    

    
    
