# Rendezvous or Lowest Random Weight (LRW) hashing

This is a Ruby implementation of LRW. It is a port of Ferd's
[LRW](https://github.com/ferd/lrw).

This hashing mechanism allows you to consistently hash to a specific node or IP
without needing to do bucketing first a'la Consistent Hashing. It also
guarantees as little key redistribution as possible.


