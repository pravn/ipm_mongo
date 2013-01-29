#!/usr/bin/ruby
class Print_things
  def self.print_cputime_comm_scatter(file_name)
    file=File.new("data/#{file_name}","w")
    h=Query_operations.return_cputime_comm("banner.wallclock"=>{"$gt"=>@wall_filter})

    h.each do 
      |x|
      file.printf("%-12d%-12d%-12s%-12s%-12s\n",
                  x["wallclock"], x["concurrency"], x["%comm"],
                  x["command"], x["username"])
    end
    file.close
  end
end
