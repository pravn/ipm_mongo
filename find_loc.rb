#!/usr/bin/ruby
def  find_loc(b, ct)
#  print b
#  if(b=~/\[total\]/)
#  puts ct
   if(b=~/(^\#)(.+\#+$)/)
	  ct+=1
  end

#  case ct 
#    when ct=0 
#            return (0)
#    when ct=1 
#	    return (1)
#    when ct=2 
#	    return (2)
#    when ct>2
#    return (ct)
#  end

  return ct

end
    
  


#      if(b=~/(^\#)(\s+$)/) 
#	p 'test'
#	ct=ct+1
#	p ct
#	  
#	  case 
#	  when ct==2
#	    p 'ct is two here', ct
#
##
#	    if(b=~/(wallclock)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
#	      p "printing wallclock stats"
#	      time_hash=Hash.new
#	      time_hash["total"]=$3
#	      time_hash["avg"]  =$5
#	      time_hash["min"]  =$7
#	      time_hash["max"]  =$9
#	    end
#
#	    if(b=~/(comm)(\s+)(\S+)/)
#	      p "printing", $2
#	      comm=Hash.new
#	      comm["avg"]  =$3
#	      comm["min"]  =$5
#	      comm["max"]  =$7
#	    end
#
#	    base["time"]=time_hash
#	    base["%comm"]=comm
#	  end
#	    h["base_stats"]=base
#
#
#      end 

