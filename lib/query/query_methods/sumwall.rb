#!/usr/bin/ruby
class Query_operations
  def self.sumwall(query)
#    puts query.inspect
    cost = 0.05/3600
    h=Array.new
    sum=0.to_i
    waste=0.to_f
    Mongo_ops.find(query).each do
      |x|
      sum+=x["base"]["wallclock"]["total"]*cost
 #     puts x
      waste+= x["banner"]["wallclock"]*x["banner"]["tasks"]*x["banner"]["%comm"]/100.0*x["base"]["comm"]["%imb"]/100.0*cost
#      puts waste
    end

    #  puts "sum of all", sum.to_i
    sumwall=sum.to_i
    wastage=waste.to_i
    
    h.push(sumwall, wastage)
    return h
  end
end
