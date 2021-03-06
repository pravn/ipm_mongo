require 'rubygems'
require 'mongo_ops'
require 'mongo'

module ParseHash
  attr   :h, :hf, :h_func

  def initialize(region)
    @h=Hash.new
    @hf=Hash.new(region)
    @h_func=Hash.new
  end

  def printhash
    puts @h
  end

  def copy
    a=@h
    return a
  end

  def mergehash(a)
      a.merge!(@hf)
      return(a)
  end

end

module Dataset

  include ParseHash
  include Mongo_ops

  def Dataset.addhash(attribute,h)
    @collection=Mongo_ops.coll(attribute)
    @collection.insert(h)
#    @collection.find.each{|row| puts row.inspect}
#    @collection.find_one().each{|row| puts row.inspect}
  end

  class Banner
    attr :collection

    include ParseHash
    include Mongo_ops

  def addhash #insert into mongodb
    Dataset.addhash("banner-stats", @h)
  end

  def printdb
    @collection.find("command"=>"gvasp").each{|row| puts row.inspect}
    puts "database count", @collection.count()
  end

  def username(username)
    @h["username"]=username
  end
  
  def command(b)
    if(b=~(/(command)(\s+:\s+)(\w+)/))
      key = $1
      val = $3
      @h[key]=val
    end
  end

  def wallclock(b)
    if(b=~(/(wallclock)(\s+:\s+)(\S+)/))
      key = $1
      val = $3
      @h["wallclock"]=val.to_f
    end
  end

  def comm(b)
    if(b=~(/(\%comm)(\s+:\s+)(\S+)/))
       key = $1
       val = $3
       @h["%comm"]=val.to_f
     end
  end

  def gflop(b)
    if(b=~(/(gflop\/sec)(\s+:\s+)(\S+)/))
      key = $1
      val = $3
      @h["gflop/s"]=val.to_f
    end
  end

  def host(b)
    if(b=~(/(host)(\s+:\s+)(\S+)/))
      key = $1
      val = $3
      @h[key]=val
    end
  end

  def mpi_tasks(b)
    if (b=~(/(mpi_tasks)(\s:\s+)(.*)/))
      key = $1
      val = $3
      
      if(val=~/(\d+)(\s+on\s+)(\d+)(\s+nodes)/)
	@h["tasks"]=$1.to_i
	@h["nodes"]=$3.to_i
      end
    end
  end


  def finalize
    @hf["banner"]=@h
    return @hf
  end


end


class Base
  include ParseHash
  include Mongo_ops
  attr :total, :avg, :min, :max, :imb

  def insert(h)
    Dataset.addhash("collection",h)
  end

    def region(b)
      if(b=~(/(region)(\s+:\s+)(\w+)/))
        nullify
        key = $1
        val = $3
        @h[key]=val
      end
    end

    def wallclock(b)
      if(b=~/(wallclock)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
        nullify
        @total=  $3
        @avg  =  $5
        @min  =  $7
        @max  =  $9
        @imb  =  100.0*(@max.to_f - @avg.to_f)/@avg.to_f
        
        assign("wallclock")

#        h=mergehash(h)
 #       Dataset.addhash("wallclock",h)
      end
    end

    def comm(b)
      if(b=~/(comm)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
        nullify
        @total = nil
        @avg   = $3
        @min   = $5
        @max   = $7
        @imb  =  100.0*(@max.to_f - @avg.to_f)/@avg.to_f

        assign("comm")
      end
    end

def gflops(b)
      if(b=~/(gflop\/sec)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
        nullify
        @total=  $3
        @avg  =  $5
        @min  =  $7
        @max  =  $9
        @imb  =  100.0*(@max.to_f - @avg.to_f)/@avg.to_f

        assign("gflops")
      end
end

def gbytes(b)
      if(b=~/(gbytes)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
        nullify
        @total=  $3
        @avg  =  $5
        @min  =  $7
        @max  =  $9
        @imb  =  100.0*(@max.to_f - @avg.to_f)/@avg.to_f

        assign("gbytes")
      end
end


  def functioncall(b)
    if(b=~/x(\s+\#\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
      puts b.inspect
      #    puts $2.inspect
      nullify
      key=$2
      @total = $4
      @min = $6
      @max = $8
      @avg = $10
      @imb = 100*(@max.to_f - @avg.to_f)/@avg.to_f
      assignfunc(key)
    end
  end  

def assign(attribute)
  h1=Hash.new
  h1["total"]=@total.to_f
  h1["avg"]  =@avg.to_f
  h1["min"]  =@min.to_f
  h1["max"]  =@max.to_f
  h1["%imb"]  =@imb.to_f
  @h[attribute]=h1
end

def assignfunc(attribute)
  h1=Hash.new
  h1["total"] = @total.to_f
  h1["avg"]  =@avg.to_f
  h1["min"]  =@min.to_f
  h1["max"]  =@max.to_f
  h1["%imb"]  =@imb.to_f
  @h_func[attribute]=h1
end

def func_finalize
  @h["functions"]=@h_func
end

  def finalize
    @hf["base"]=@h
    return @hf
  end

def nullify
  @total=nil
  @avg=nil
  @min=nil
  @max=nil
  return
end
  
      

end

class NoRegion
    include ParseHash

    def region(b)
      if(b=~(/(region)(\s+:\s+)(\w+)/))
        key = $1
        val = $3
        @h[key]=val
      end
    end


  
  end

end





