#!/usr/bin/ruby
class Print_things
  attr_reader :cost
  @cost = 0.05/3600
  def self.print_wastage(dumpfile)
    file=File.new("data/#{dumpfile}/wastage.txt", "w")

      if(!File.directory?("data/#{dumpfile}"))
        Dir.mkdir("data/#{dumpfile}")
      end
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>0.01})

    file.printf("%-12d%-12d%-12f\n", 0.01, h[0], h[1] )
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>10.0})
##    puts h
    file.printf("%-12d%-12d%-12d\n", 10.0, h[0],h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>20.0})
    file.printf("%-12d%-12d%-12d\n", 20.0, h[0],h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>30.0})
    file.printf("%-12d%-12d%-12d\n", 30.0, h[0],h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>40.0})
    file.printf("%-12d%-12d%-12d\n", 40.0, h[0], h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>50.0})
    file.printf("%-12d%-12d%-12d\n", 50.0, h[0], h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>60.0})
    file.printf("%-12d%-12d%-12d\n", 60.0, h[0],h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>70.0})
    file.printf("%-12d%-12d%-12d\n", 70.0, h[0],h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>80.0})
    file.printf("%-12d%-12d%-12d\n", 80.0, h[0], h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>90.0})
    file.printf("%-12d%-12d%-12d\n", 90.0, h[0], h[1])
    h=Query_operations.sumwall("base.comm.%imb"=>{"$gte"=>0.0, "$lte"=>100.0})
    file.printf("%-12d%-12d%-12d\n", 100.0, h[0], h[1])
    file.close
  end
end
    
  
