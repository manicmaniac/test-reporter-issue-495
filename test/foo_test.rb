$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "minitest/autorun"
require "simplecov"

SimpleCov.start

require "foo"

class TestFoo < MiniTest::Test
  def test_add
    assert_equal 1, Foo.add(0, 1)
  end

  def test_sub
    assert_equal 1, Foo.sub(2, 1)
  end
end
