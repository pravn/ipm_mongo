#!/usr/bin/ruby
class Query_operations
  def self.return_collective_attr(attrib, imb, attrib_imb, query)
    h=Array.new
    count = 0
    #    
    Mongo_ops.find(query).each do
      |x|
      if (x["base"]["comm"]["%imb"]>imb)
        if defined? (x["base"]["functions"][attrib.to_s]["total"]/(x["base"]["wallclock"]["total"]*x["banner"]["%comm"])>attrib_imb)
          count += 1
          x1=Hash.new
          x1["commimb"]=x["base"]["comm"]["%imb"].to_i
          x1[attrib.to_s]=x["base"]["functions"][attrib.to_s]["%imb"].to_i
          x1["concurrency"]=x["banner"]["tasks"].to_i
          x1["wallclock"]=x["banner"]["wallclock"].to_i
          x1["%comm"]=x["banner"]["%comm"].to_i
          x1["username"]=x["banner"]["username"].split("/")[-1]
          x1["command"] = command(x)

          h.push(x1)
        end
      end
    end

    puts "File count for #{attrib} imbalance query: \t", count
    return h
  end
end
