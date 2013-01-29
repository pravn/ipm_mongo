#!/usr/bin/ruby
class Print_things
  def self.print_alltoall_attributes
    #print various metrics appertaining to alltoall
    h=Query_operations.return_alltoall_attr("banner.wallclock"=>{"$gt"=>@wall_filter})
    
    #open files for writing
    file1=File.new("data/alltoall_wall.txt","w")
    #	    file2=File.new("allreduce_conc","w")
    #	    file3=File.new("allreduce_commimb","w")

    #pull out quantities buried in the array of hashes thus contained within
    h.each do 
      |x|
      file1.print(x["wallclock"],"\t",x["commimb"],"\t",x["alltoall_imb"], "\n")
    end
    file1.close

    #put others 
  end
end
