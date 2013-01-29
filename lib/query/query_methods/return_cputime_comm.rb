#!/usr/bin/ruby
class Query_operations
  def self.return_cputime_comm(query)
    h=Array.new
    count = 0
    Mongo_ops.find(query).each do
      |x|
      x1= Hash.new

      x1["wallclock"]=x["base"]["wallclock"]["total"].to_i
      x1["%comm"] = x["banner"]["%comm"].to_i
      x1["concurrency"] = x["banner"]["tasks"].to_i
      x1["username"] = x["banner"]["username"].split('/')[-1]
      x1["command"] = command(x)
      h.push(x1)
    end
    return h
  end
end
