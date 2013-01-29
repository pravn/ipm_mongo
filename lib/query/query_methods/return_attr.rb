class Query_operations
  def self.return_attr(imb_attr,query)
    h=Array.new

    Mongo_ops.find(query).each do
      |x|
      x1=Hash.new
      x1["wallclock"]=x["base"]["wallclock"]["total"]
      x1["#{imb_attr}_total"]=x["base"][imb_attr]["total"]
      x1[imb_attr]=x["base"][imb_attr]["%imb"]
      x1["concurrency"]=x["banner"]["tasks"]
      x1["%comm"]=x["banner"]["%comm"]
      x1["username"]=x["banner"]["username"].split('/')[-1]
      x1["command"]=command(x)

      x1["fclose"]=0
      x1["fclose_imb"]=0
      x1["fwrite"]=0
      x1["fwrite_imb"]=0
      x1["write"]=0
      x1["write_imb"]=0

      if defined? x["base"]["functions"]["fclose"]["total"]
        x1["fclose"]=x["base"]["functions"]["fclose"]["total"].to_i
        x1["fclose_imb"]=x["base"]["functions"]["fclose"]["%imb"]
      end

      if defined? x["base"]["functions"]["fwrite"]["total"]
        x1["fwrite"]=x["base"]["functions"]["fwrite"]["total"].to_i
        x1["fwrite_imb"]=x["base"]["functions"]["fwrite"]["%imb"]
      end

      if defined? x["base"]["functions"]["write"]["total"]
        x1["write"]=x["base"]["functions"]["write"]["total"].to_i
        x1["write_imb"]=x["base"]["functions"]["write"]["%imb"]
      end

      h.push(x1)

      
    end
    return h
  end
end
