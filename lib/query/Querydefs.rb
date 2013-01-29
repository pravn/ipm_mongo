$LOAD_PATH << '.'
$LOAD_PATH << './query_methods'


class Query_operations 

require 'return_attr'
require 'return_imb_correlation_attr'
require 'return_cputime_comm'
require 'return_concurrency_comm'
require 'return_cputime_concurrency'
require 'return_allreduce_attr'
require 'return_alltoall_attr'
require 'return_collective_attr'
require 'return_collective_perc'
require 'return_wastage'
require 'sumwall'
require 'mem_footprint'
require 'mem_footprint_scaling'
require 'command'

end  #end of class 

