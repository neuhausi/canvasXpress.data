# ----------------------------------  
# Copyright(c) Aggregate Genius Inc.
# ----------------------------------

# run as a local job
# be sure to set the environment to one directory up from this one.

revdepcheck::revdep_reset()
revdepcheck::revdep_check('.', quiet = F)
