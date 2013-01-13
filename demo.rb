require 'smackit'
conf.echo = false

class Counter
  attr_accessor :data
  def initialize(initial)
    @data = initial
  end
end

expected = [0, 1, 2, 0, 5, 0, 3, 0, 3]
actual = []

c = Counter.new 0
actual << c.data

c.data = 1
actual << c.data

c.data = 2
actual << c.data

c = c.smackit
actual << c.data

c.data = 5
actual << c.data

c = c.smackit
actual << c.data

c = Counter.new 3
actual << c.data

c.data = 0
actual << c.data

c = c.smackit
actual << c.data

if expected == actual then puts "\n\nTEST PASSED" else puts "\n\nTEST FAILED" end