require "rlrw/version"
require "murmurhash3"

module Rlrw
  module LRW
    MOD = 2147483648

    def self.all(key, nodes)
      res = nodes.map do |node|
        { node: node, weight: self.phash(key, node) }
      end
      res.sort_by { |res| -res[:weight] }
    end

    def self.top(key, nodes, len)
      self.all(key, nodes).take(len)
    end

    def self.phash(key, node)
      MurmurHash3::V32.str_hash("#{node}#{key}", MOD)
    end
  end
end
