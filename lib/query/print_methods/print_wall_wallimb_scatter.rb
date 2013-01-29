#!/usr/bin/ruby
class Print_things
  def self.print_wall_wallimb_scatter(file_name)
    file=File.new("data/#{file_name}","w")
    h=Query_operations.return_attr("banner.wallclock","wallclock",
                                   "banner.wallclock"=>{"$gt"=>@wall_filter})
    
    h.each do 
      |x|
      x.each do 
        |key,value|
        pimb=key
        wallclock=value

        #      puts pimb.inspect, "\t", wallclock.inspect
        file.printf("%-15d%-15d\n",
                    wallclock, pimb)
      end

    end

    file.close
  end
end
