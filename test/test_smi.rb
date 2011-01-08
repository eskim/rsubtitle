require File.dirname(__FILE__) + '/test_helper'

require 'rsubtitle'

class TestSmi < Test::Unit::TestCase

  def test_parse
    smi = Rsubtitle::SMI.parse(fixture("utf8.smi"))
    
    assert_equal smi.class, Rsubtitle::SMI
    assert_equal smi.size, 2
    assert_equal smi[0][:start], 10
    assert_equal smi[0][:subtitle], "first"
    assert_equal smi[0][:duration], 7390

  end
end
