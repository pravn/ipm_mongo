#!/usr/bin/ruby
class Query_operations
  def self.return_collective_perc(query)
    h=Array.new

    count= 0
    Mongo_ops.find(query).each do 
      |x|
      collectives=0
      x1=Hash.new
      x1["%comm"] = x["banner"]["%comm"].to_i
      
      if defined? (x["base"]["functions"]["MPI_Allreduce"]["total"]/(x["base"]["wallclock"]["total"]))
        collectives += x["base"]["functions"]["MPI_Allreduce"]["total"]/x["base"]["wallclock"]["total"]
      end
      
      if defined? (x["base"]["functions"]["MPI_Alltoall"]["total"]/(x["base"]["wallclock"]["total"]*x["banner"]["%comm"]))
        collectives += x["base"]["functions"]["MPI_Alltoall"]["total"]/x["base"]["wallclock"]["total"]
      end
      
      if defined? (x["base"]["functions"]["MPI_Alltoallv"]["total"]/(x["base"]["wallclock"]["total"]))
        collectives += x["base"]["functions"]["MPI_Alltoallv"]["total"]/x["base"]["wallclock"]["total"]
      end
      
      x1["%collectives"]= collectives*100
      x1["concurrency"] = x["banner"]["tasks"]
      x1["username"] = x["banner"]["username"].split('/')[-1]
      x1["command"] = command(x)

      count+=1
      h.push(x1)
    end

    puts "Number of records ", count 
    return h

  end
end
