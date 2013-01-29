#!/usr/bin/ruby
class Query_operations
  def self.return_concurrency_comm(query)
    h=Array.new
    @coll.find(query).each do
      |x|
      h.push(x["banner"]["tasks"]=>x["banner"]["%comm"])
    end
    return h
  end
end
