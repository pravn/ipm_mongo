#!/usr/bin/ruby
class Query_operations
  def self.mem_footprint(query)
    h=Array.new
    
    Mongo_ops.find(query).each do
      |x|
      x1=Hash.new
      x1["username"]=x["banner"]["username"].split("/")[-1]
      x1["wallclock"]=x["banner"]["wallclock"]
      x1["concurrency"]=x["banner"]["tasks"]
      x1["nodes"]=x["banner"]["nodes"]
      x1["gbytes"]=x["base"]["gbytes"]["total"]
      x1["command"]= command(x)
      h.push(x1)
    end
    return h
  end
end
