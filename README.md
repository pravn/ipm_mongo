ipm_mongo
=========

MongoDB database written in Ruby to gather IPM profiling output from NERSC Carver/Magellan runs. 
We collect information from the IPM output to give statistics on users and then use the scripts to do some analysis on them. For example, a simple case would be to sort them based on wallclock usage. 

Using the IPM profiling output we can give a little more insight on the apps themselves. The profiling output can give clues about load imbalance in these applications by looking for collectives such as ALLREDUCE and the maximum and minimum times taken by them for each MPI rank.

