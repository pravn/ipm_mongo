#!/usr/bin/ruby
class Query_operations
  def self.return_allreduce_attr(query,imb,attr_imb)
    h = Array.new 
    
     Mongo_ops.find(query).each do 
      |x|
      if (x["base"]["comm"]["%imb"] >imb)
        if defined? (x["base"]["functions"]["MPI_Allreduce"]["total"]/(x["base"]["wallclock"]["total"]*x["banner"]["%comm"])>attr_imb/100.0)
            x1=Hash.new
            x1["commimb"]=x["base"]["comm"]["%imb"].to_i
            x1["allred_imb"]=x["base"]["functions"]["MPI_Allreduce"]["%imb"].to_i
            x1["concurrency"]=x["banner"]["tasks"].to_i
            x1["wallclock"]=x["banner"]["wallclock"].to_i
            h.push(x1)
        end
      end
    end
    return h
  end
end
