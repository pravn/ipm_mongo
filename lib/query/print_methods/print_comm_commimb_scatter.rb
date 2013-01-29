#!/usr/bin/ruby
class Print_things
  def self.print_comm_commimb_scatter(file_name)
    file=File.new(file_name,"w")
    h=Query_operations.return_attr("banner.%comm","comm","banner.wallclock"=>{"$gt"=>@wall_filter})

    h.each do 
      |x|
      x.each do 
        |key, value|
        pimb=key
        pcomm=value
        file.print pimb, "\t\t", pcomm, "\n"
      end
    end
    file.close
  end
end
