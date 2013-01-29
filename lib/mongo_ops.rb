require 'mongo'

module Mongo_ops
  attr_reader :db, :coll

  def Mongo_ops.initialize(dbname)
    puts "This is the database: #{dbname}"
    @db = Mongo::Connection.new.db("parsed_data-#{dbname.to_s}")
  end

  def Mongo_ops.coll(coll1)
    puts "This is the collection: #{coll1.to_s}"
    @coll=@db[coll1]
    return @coll
  end

  def Mongo_ops.find
    print 'de nada'
  end



end
