#!/usr/bin/ruby
class Query_operations
  def self.return_wastage(attrib, imb_attr,query)
    h=Array.new

    attrib=attrib.split('.')[1]
    count=0
    Mongo_ops.find(query).each do
      |x|
#      h.push(x["base"][imb_attr]["%imb"]=>x["base"]["wallclock"]["total"])
      wastage = x["base"][imb_attr]["%imb"]*x["base"]["wallclock"]["total"]/100.0
      dollar_wastage= @cost*wastage
      
#      puts "h=", h.inspect
    end
    return h
  end      
end
