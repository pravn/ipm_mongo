#!/usr/bin/ruby
class Print_things
    def self.print_collective_perc(file_name)
      #print % of allreduce+alltoall+alltoallv as function of concurrency
      file=File.new("data/#{file_name}", "w")
      h=Query_operations.return_collective_perc("banner.wallclock"=>{"$gt"=>@wall_filter})
      
      h.each do 
        |x|
        file.printf("%-15d%-15d%-15d%-15s%-15s\n", 
                    x["concurrency"], x["%comm"].to_i, x["%collectives"].to_i,
                    x["command"], x["username"])
      end
      file.close
    end
end
