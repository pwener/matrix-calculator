require 'singleton'

class TaskStack
  include Singleton

  def initialize
    @tasks = Array.new
  end

  def put(index, content)
    @tasks.push([index: index, content: content])
  end
end
