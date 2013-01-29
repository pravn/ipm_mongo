$LOAD_PATH << '.'
$LOAD_PATH << './print_methods'

class Print_things
  require 'print_collective_imb'
  require 'print_cputime_comm_scatter'
  require 'print_comm_commimb_scatter'
  require 'print_concurrency_comm'
  require 'print_wall_wallimb_scatter'
  require 'print_wall_commimb_scatter'
  require 'print_wall_ioimb_scatter'
  require 'print_wallimb_commimb_scatter'
  require 'print_wallimb_ioimb_scatter'
  require 'print_allreduce_attributes'
  require 'print_alltoall_attributes'
  require 'print_collective_perc'
  require 'print_imb_to_file'
  require 'print_wastage'
  require 'print_memory_footprint'

  attr_reader :wall_filter
  @wall_filter = 1200


#  def self.print_cputime_concurrency_scatter(file_name)
#    file=File.new(file_name,"w")
#    h=Query_operations.return_cputime_concurrency("banner.wallclock"=>{"$gt"=>1200})
#
#    h.each do 
#      |x|
#      x.each do 
#        |cputime,conc| 
#        file.print cputime,"\t\t", conc, "\n"
#      end
#    end
#    file.close
#  end
  

#def self.print_comm_wallimb_scatter(file_name)
#  file=File.new("data/#{file_name},"w")
#  h=Query_operations.return_attr("banner.%comm","wallclock","banner.wallclock"=>{"$gt"=>1200})

#  h.each do 
#    |x|
#    x.each do 
#      |key, value|
#      pimb=key
#      pcomm=value
#      file.print pimb, "\t\t", pcomm, "\n"
#    end
#  end
#  file.close
#end


#    def self.print_collective_imb(attrib,imb,attrib_imb,dumpfile)
#      #print various metrics appertaining to allreduce
#      puts "attribute\t", attrib.to_s
#      h=Query_operations.return_collective_attr(attrib.to_s,imb,attrib_imb,
#                                                 "banner.wallclock"=>{"$gt"=>@wall_filter})
#      puts h
#      
#      #open files for writing
#      if(!File.directory?("data/#{dumpfile}"))
#        Dir.mkdir("data/#{dumpfile}")
#      end

#      file1=File.new("data/#{dumpfile}/#{attrib.to_s}_wall.txt","w")
#      file2=File.new("data/#{dumpfile}/#{attrib.to_s}_wall_user_app.txt","w")

      #pull out quantities buried in the array of hashes thus contained within
#      puts h
#      h.each do 
#        |x|
#        file1.printf("%-12d%-12d%-12d%-12d%-12d\n",
#                      x["wallclock"], 
#                      x["concurrency"], x["%comm"],
#                      x["commimb"], x[attrib.to_s])
#                     x["command"], x["username"])
#        file2.printf("%-15s%-15s\n", 
#                     x["command"],x["username"])
#        puts x["wallclock"],"\t",x["commimb"],"\t",x[attrib.to_s], "\n"
#      end
#      file1.close
#      file2.close
#
#    end

end #end of class
