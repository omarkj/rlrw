# Rendezvous or Lowest Random Weight (LRW) hashing

This is a Ruby implementation of LRW. It is a port of Ferd's
[LRW](https://github.com/ferd/lrw). Even if it is a port, it cannot be used with
the original implementation as it uses another hash function.

This hashing mechanism allows you to consistently hash to a specific node
without needing to do bucketing first a'la Consistent Hashing. It also
guarantees as little key redistribution as possible.

## Interface

The `all/2` function gives an ordering of all nodes:

```
<= Rlrw::LRW.all("my_item", ["127.0.0.1", "255.0.0.1", "192.2.1.2", "192.198.2.1"])
=> ["255.0.0.1", "192.2.1.2", "127.0.0.1", "192.198.2.1"]
<= Rlrw::LRW.all("my_item", ["127.0.0.1","198.2.1.2","192.198.2.1","10.10.100.10"])
=> ["198.2.1.2", "10.10.100.10", "127.0.0.1", "192.198.2.1"]
<= Rlrw::LRW.all("my_item", ["127.0.0.1","192.198.2.1"])
=> ["127.0.0.1", "192.198.2.1"]
<= Rlrw::LRW.all("my_item", ["127.0.0.1","192.18.211.12","23.66.77.88","252.11.11.11"])
=> ["192.18.211.12", "23.66.77.88", "127.0.0.1", "252.11.11.11"]
<= Rlrw::LRW.all("my_other_item", ["127.0.0.1","192.18.211.12","23.66.77.88","252.11.11.11"])
=> ["252.11.11.11", "23.66.77.88", "192.18.211.12", "127.0.0.1"]
<= Rlrw::LRW.all("my_other_item", ["127.0.0.1","192.18.211.12","23.66.77.88","252.11.11.11"])
=> ["252.11.11.11", "23.66.77.88", "192.18.211.12", "127.0.0.1"]
```

The `top/3` function returns a subset. It is using `all/2` in its implementation

```
<= Rlrw::LRW.top("12123", ["127.0.0.1","255.0.0.1","198.2.1.2","192.198.2.1"], 2)
=> ["127.0.0.1", "198.2.1.2"]
```

Custom hashing functions can be passed by calling `all/3` and `top/3`, where the
argument of each function must be a lambda that accepts two arguments, `key`, and
`node` and returns a number.

## Test

```
$ bundle install
$ bundle exec rake
```
