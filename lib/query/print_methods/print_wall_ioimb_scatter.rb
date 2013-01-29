#!/usr/bin/ruby
class Print_things
    def self.print_wall_ioimb_scatter(dumpfile)
      file=File.new("data/#{dumpfile}/wall_ioimb_scatter.txt","w")
      file1=File.new("data/#{dumpfile}/wall_ioimb_scatter_user_app.txt","w")
      file2=File.new("data/#{dumpfile}/io_breakdown.txt","w")
      file3=File.new("data/#{dumpfile}/io_time.txt", "w")
      h=Query_operations.return_attr("gbytes",
                                     "banner.wallclock"=>{"$gt"=>@wall_filter})
      file2.printf("%-15s%-15s%-15s%-6s%-6s%-5s%-5s%-5s%-5s%-5s%-5s\n", 
                   "command", "user", "walltime", 
                   "gbytes_total", "gbytes_imb",
                   "fclose", "fclose_imb",
                   "fwrite", "fwrite_imb",
                   "write", "write_imb")
                       
      h.each do 
        |x|
        x.each do 
          file.printf("%-15d%-10d%-10d%-10d\n",
                      x["wallclock"].to_i, x["concurrency"].to_i,
                      x["%comm"].to_i, x["gbytes"].to_i)
          file1.printf("%-15s%-15s\n",
                       x["command"],x["username"])
          
#          if  !(x["fclose"].nil?)
          file2.printf("%-15s%-15s%-15d%-6d%-6s%-5d%-5s%-5s%-5s%-5s%-5s\n",  
                       x["command"],x["username"],x["wallclock"], 
                       x["gbytes_total"],x["gbytes"],
                       x["fclose"], x["fclose_imb"], 
                       x["fwrite"],x["fwrite_imb"],
                       x["write"],x["write_imb"])

          file3.printf("%-8s\n",
                       x["gbytes_total"])
          
#          end

        end
      end

      file.close
      file1.close
      file2.close
      file3.close
    end
end
