require 'mongo'
$LOAD_PATH << '.'
$LOAD_PATH << './print_methods'

require 'Print_things'
require 'Querydefs'

class Mongo_ops

  attr_reader :db, :coll, :sumwall, :sum

  def self.connection(dbname)
    puts "This is the database: #{dbname}"
    @db = Mongo::Connection.new.db("parsed_data-#{dbname}")
#    @coll=@db['parsed']
    @sumwall=0
    puts "Starting connection"
  end

  def self.collection(coll)
    @coll=@db[coll]
    puts "Entering collection named \"#{coll}\""
  end

  def self.insert(h)
    @coll.insert(h)
  end

  def self.find(x)
    h=Array.new
    puts "Inspecting query", x.inspect
    @coll.find(x).each do 
	    |y| h.push(y)
    end
#    puts h
    puts "database count", @coll.count()
    return h
  end

  def self.printeach()
	  @coll.find().each{|x| puts x.inspect}
  end

  def self.count(query)
    count1=0.0
    @coll.find(query).each do
      |x| 
      count1=count1+1
    end
    return count1
  end

  def self.sumwall(query)
#    attribute=query.split('=>')[0].split('.')
    puts query.inspect
    sum=0.to_i
    @coll.find(query).each do
      |x|
  #    puts x["base"]["wallclock"]["total"]
      sum+=x["base"]["wallclock"]["total"]
    end
#  puts "sum of all", sum.to_i
    @sumwall=sum.to_i
    return @sumwall
  end


  def self.sumtot
#    @sumtot=0.to_i
    sum=0
    walltot=0
    @coll.find().each do 
      |x|
      y1=Hash.new
      y2=Hash.new
      
      y1=x["base"]
      y2=y1["wallclock"]
      walltot=y2["total"]
      sum+=walltot
    end
    puts "sum of all", sum
  end

end



conn= Mongo_ops.connection(ARGV[0])
coll= Mongo_ops.collection("collection")

#Mongo_ops.print_imb_to_file("wallclock_stats.txt","base.wallclock.%imb")

Print_things.print_imb_to_file("wallclock_stats.txt","base.wallclock.%imb")

#debug
#printeach
#  find("base.wallclock.%imb"=>{"$gte"=>0.0, "$lte"=>0.1})
#debug

#Print_things.print_imb_to_file("mpi_stats.txt","base.comm.%imb")
#Print_things.print_imb_to_file("io_stats.txt", "base.gbytes.%imb")
#Print_things.print_imb_to_file("wallclock_imb_wallclockhrs.txt", "base.wallclock.%imb")

#Print_things.print_comm_wallimb_scatter("comm_wallimb_scatter.txt")
#Print_things.print_comm_commimb_scatter("comm_commimb_scatter.txt")
#Print_things.print_wall_wallimb_scatter("wall_wallimb_scatter.txt")
#Print_things.print_wall_commimb_scatter("wall_commimb_scatter.txt")
#Mongo_ops.print_wall_ioimb_scatter("wall_ioimb_scatter.txt")
#Mongo_ops.print_cputime_comm_scatter("cputime_comm_scatter.txt")
#Mongo_ops.print_concurrency_comm("conc_comm_scatter.txt")
#Mongo_ops.print_cputime_concurrency_scatter("cputime_conc_scatter.txt")
#Mongo_ops.print_wallimb_commimb_scatter("wallimb_commimb_scatter.txt")
#Mongo_ops.print_wallimb_ioimb_scatter("wallimb_ioimb_scatter.txt")
#Print_things.print_allreduce("allreduce_imb_scatter.txt")

#Print_things.wall_imb_comm_imb_scatter("wall_commimb_scatter.txt")
#Print_things.print_cputime_comm_scatter("cputime_comm_scatter.txt")

dumpfile=ARGV[0]

Print_things.print_collective_imb("MPI_Allreduce", 19, 20, dumpfile)
#Print_things.print_collective_imb("MPI_Alltoall", 20, 20, dumpfile)
#Print_things.print_collective_imb("MPI_Alltoallv", 20, 20, dumpfile)
#Print_things.print_collective_perc("collective_perc.txt")
#Print_things.print_collective_imb("MPI_Alltoall")
#Print_things.print_alltoall_attributes
#Print_things.print_wastage(dumpfile)
#Print_things.print_memory_footprint(dumpfile)
#Print_things.print_wall_ioimb_scatter(dumpfile)

#mongo_ops.sumtot

#mongo_ops.printeach
