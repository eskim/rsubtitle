require File.dirname(__FILE__) + '/test_helper'

require 'rsubtitle'

class TestSmi < Test::Unit::TestCase

  def setup
    @smi = Rsubtitle::SMI.parse(fixture("utf8.smi"))
  end

  def test_parse
    smi = Rsubtitle::SMI.parse(fixture("utf8.smi"))
    
    assert_equal smi.class, Rsubtitle::SMI
    assert_equal smi.size, 3

  end

  def test_entry
    entries = @smi.entries
    assert_equal entries.class, Array

    assert_equal entries[0].start, 10
    assert_equal entries[0].body, "first"
    assert_equal entries[0].duration, 7390

    assert_equal entries[1].start, 8000
    assert_equal entries[1].body, "second"
    assert_equal entries[1].duration, 10

#     assert_equal entries[2].body, "with <b>html</b>"
    assert_equal entries[2].body, "with html" # stripped
  end

  def test_write_to_srt

    smi = Rsubtitle::SMI.parse(fixture("utf8.smi"))
    srt_str = smi.format(:srt)

    assert_not_nil srt_str
  end

end
