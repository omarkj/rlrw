require "rlrw/version"
require "murmurhash3"

module Rlrw
  module LRW
    MOD = 2147483648

    PHASH = lambda { |key, node| MurmurHash3::V32.str_hash("#{node}#{key}", MOD) }

    def self.all(key, nodes, phash=PHASH)
      self.all_weights(key, nodes, phash).map do | node |
        node[:node]
      end
    end

    def self.top(key, nodes, len, phash=PHASH)
      self.top_weights(key, nodes, len, phash).map do | node |
        node[:node]
      end
    end

    def self.all_weights(key, nodes, phash=PHASH)
      res = nodes.map do |node|
        { node: node, weight: phash.call(key, node) }
      end
      res.sort_by { |res| -res[:weight] }
    end

    def self.top_weights(key, nodes, len, phash=PHASH)
      self.all_weights(key, nodes, phash).take(len)
    end

  end
end
