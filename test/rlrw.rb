require 'minitest/autorun'
require 'digest/sha1'
require 'rlrw'

describe Rlrw::LRW, "LRW" do

  it "calculates all" do
    Rlrw::LRW.all("my_item", ["b","c","d"]).must_equal(["c", "b", "d"])
  end

  it "calculates top" do
    Rlrw::LRW.top("my_item", ["b","c","d"], 2).must_equal(["c", "b"])
  end

  it "calculates all and returns weights" do
    Rlrw::LRW.all_weights("my_item", ["b","c","d"]).must_equal([{:node=>"c", :weight=>4112589638}, {:node=>"b", :weight=>3970763645},
                                                                {:node=>"d", :weight=>815949913}])
  end

  it "calculates top and returns weights" do
    Rlrw::LRW.top_weights("my_item", ["b","c","d"], 2).must_equal([{:node=>"c", :weight=>4112589638}, {:node=>"b", :weight=>3970763645}])
  end

  it "calculates all with another hash function" do
    f = lambda { |key, node| Digest::SHA1.hexdigest("#{node}#{key}").to_i(16) }
    Rlrw::LRW.all("my_item", ["b","c","d"], f).must_equal(["d", "c", "b"])
  end

  it "calculates top with another hash function" do
    require 'digest/sha1'
    f = lambda { |key, node| Digest::SHA1.hexdigest("#{node}#{key}").to_i(16) }
    Rlrw::LRW.top("my_item", ["b","c","d"], 2, f).must_equal(["d", "c"])
  end

  it "calculates all and returns weights with another hash function" do
    f = lambda { |key, node| Digest::SHA1.hexdigest("#{node}#{key}").to_i(16) }
    Rlrw::LRW.all_weights("my_item", ["b","c","d"], f).must_equal([{:node=>"d", :weight=>1257752084205904020026775133107610541280950115641},
                                                                   {:node=>"c", :weight=>437434023516257654645300587808082606734576988647},
                                                                   {:node=>"b", :weight=>12535624296688143233642322168769247078306177530}])
  end

  it "calculates top and returns weights with another hash function" do
    f = lambda { |key, node| Digest::SHA1.hexdigest("#{node}#{key}").to_i(16) }
    Rlrw::LRW.top_weights("my_item", ["b","c","d"], 2, f).must_equal([{:node=>"d", :weight=>1257752084205904020026775133107610541280950115641},
                                                                      {:node=>"c", :weight=>437434023516257654645300587808082606734576988647}])
  end

end
