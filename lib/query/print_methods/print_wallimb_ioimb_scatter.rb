#!/usr/bin/ruby
class Print_things
  def self.print_wallimb_ioimb_scatter(file_name)
    file=File.new(file_name,"w")
    h=Query_operations.return_imb_correlation_attr("gbytes",
                                                   "banner.wallclock"=>{"$gt"=>@wall_filter})
    
    h.each do 
      |x|
      x.each do 
        |key,value|
        pimb_wall=key
        pimb_io=value

        file.print pimb_wall, "\t\t", pimb_io, "\n"
      end

    end

    file.close
  end
end
