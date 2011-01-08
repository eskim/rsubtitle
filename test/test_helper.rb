$:.unshift File.dirname(__FILE__) + '/../lib'

require 'test/unit'


def fixture(name)
  File.dirname(__FILE__) + "/fixtures/#{name}"
end
