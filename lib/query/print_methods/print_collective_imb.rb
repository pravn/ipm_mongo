class Print_things
    def self.print_collective_imb(attrib,imb,attrib_imb,dumpfile)
#      #print various metrics appertaining to allreduce
      puts "attribute\t", attrib.to_s
      h=Query_operations.return_collective_attr(attrib.to_s,imb,attrib_imb,
                                                 "banner.wallclock"=>{"$gt"=>@wall_filter})
#      puts h
#      
#      #open files for writing
      if(!File.directory?("data/#{dumpfile}"))
        Dir.mkdir("data/#{dumpfile}")
      end

      file1=File.new("data/#{dumpfile}/#{attrib.to_s}_wall.txt","w")
      file2=File.new("data/#{dumpfile}/#{attrib.to_s}_wall_user_app.txt","w")

      #pull out quantities buried in the array of hashes thus contained within
#      puts h
      h.each do 
        |x|
        file1.printf("%-12d%-12d%-12d%-12d%-12d\n",
                      x["wallclock"], 
                      x["concurrency"], x["%comm"],
                      x["commimb"], x[attrib.to_s])
#                     x["command"], x["username"])
        file2.printf("%-15s%-15s\n", 
                     x["command"],x["username"])
#        puts x["wallclock"],"\t",x["commimb"],"\t",x[attrib.to_s], "\n"
      end
      file1.close
      file2.close
#
    end
end
