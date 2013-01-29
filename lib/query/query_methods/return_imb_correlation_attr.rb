#!/usr/bin/ruby
class Query_operations
  def self.return_imb_correlation_attr(attrib,query)
    h=Array.new

    @coll.find(query).each do
      |x|
      h.push(x["base"]["wallclock"]["%imb"]=>x["base"][attrib]["%imb"])
    end
    return h
  end
end
