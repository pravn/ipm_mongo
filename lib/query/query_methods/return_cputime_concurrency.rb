#!/usr/bin/ruby
class Query_operations
  def self.return_cputime_concurrency(query)
    h=Array.new
    @coll.find(query).each do
      |x|
      h.push(x["base"]["wallclock"]["total"]=>x["banner"]["tasks"])
    end
    return h
  end
end
