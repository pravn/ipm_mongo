#!/usr/bin/ruby
class Print_things
  def self.print_imb_to_file(file_name, imb_attribute)
    file=File.new("data/#{file_name}","w")
    #    puts imb_attribute.inspect
    #    file.print "0.01\t", sumwall(imb_attribute=>{"$gte"=>00, "$lte"=>10000000}), "\n"
    file.print "0.01\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>0.01}), "\n"
    file.print "0.05\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>0.05}), "\n"
    file.print "0.1\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>0.1}), "\n"
    file.print "0.5\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>0.5}), "\n"
    file.print "1.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>1.0}), "\n"
    file.print "5.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>5.0}), "\n"
    file.print "10.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>10.0}), "\n"
    file.print "10.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>15.0}), "\n"
    file.print "20.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>20.0}), "\n"
    file.print "30.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>30.0}), "\n"
    file.print "40.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>40.0}), "\n"
    file.print "50.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>50.0}), "\n"
    file.print "60.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>60.0}), "\n"
    file.print "70.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>70.0}), "\n"
    file.print "80.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>80.0}), "\n"
    file.print "90.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>90.0}), "\n"
    file.print "100.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>100.0}), "\n"
    file.print "300.0\t", Mongo_ops.sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>300.0}), "\n"
    #    file.print "400.0\t", sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>400.0}), "\n"
    #    file.print "2000.0\t", sumwall(imb_attribute=>{"$gte"=>0.0, "$lte"=>2000.0}), "\n"

    file.close
  end
end
