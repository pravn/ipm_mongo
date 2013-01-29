#!/usr/bin/ruby
class Print_things
  def self.print_wallimb_commimb_scatter(file_name)
    file=File.new(file_name,"w")
    h=Query_operations.return_imb_correlation_attr("comm",
                                                   "banner.wallclock"=>{"$gt"=>@wall_filter})
    
    h.each do 
      |x|
      x.each do 
        |key,value|
        pimb_wall=key
        pimb_comm=value

        #          puts pimb_wall.inspect, "\t", pimb_comm.inspect
        file.print pimb_wall, "\t\t", pimb_comm, "\n"
      end

    end

    file.close
  end
end
